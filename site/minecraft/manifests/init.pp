class minecraft {
  include profile::base

  $minecraft_directory = "/opt/minecraft"
  $jar_location = "https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar"

  file { $minecraft_directory:
    ensure => 'directory',
  }

  file { "${minecraft_directory}/minecraft_server.jar":
    ensure => file,   
    source => $jar_location,
    before => Service['minecraft_server'],
  }

  package {'java':
    ensure => installed,
  }

  file { "${minecraft_directory}/eula.txt":
    ensure => file,
    content => "eula=true",
  }

  file { '/etc/systemd/system/minecraft_server.service':
    ensure  => file,
    content => epp('minecraft/minecraft_server.epp'),
  }

  service { 'minecraft_server':
    ensure => running,
    enable => true,
    require => [
      Package['java'],
      File['/etc/systemd/system/minecraft_server.service'],
      File["${minecraft_directory}/minecraft_server.jar"],
      File["${minecraft_directory}/eula.txt"]],
  }
}
