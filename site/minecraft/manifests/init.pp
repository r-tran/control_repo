class minecraft {
  file { '/opt/minecraft':
    ensure => 'directory',
  }
  file { 'minecraft_server_jar':
    ensure => file,   
    source => "https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar",
  }
}
