class profile::ssh_server {
    package {'openssh-server':
        ensure => present,
    }
    service { 'sshd':
        ensure => 'running',
        enable => 'true',
    }
    ssh_authorized_key { 'root@master.puppet.vm':
        ensure => present,
        user   => 'root',
        type   => 'ssh-rsa',
        key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDg6D5WyXo3tjgHdVitN5FTHKqmW1VJArJ25Xya2UnFJLNPrcDARnh6e4+vbFfQErLWHI9xWGuw0VcCVgHNsvIpu2N2umZcz3yByZkXqgOobojbton0CiIFsEFgdZi7z0XpGD/0fNXWKZ/pU1JuEzhH63w9BQn/qXM8yFuKWm+Ubkhou26gVImTc/8+yrVNYiOMpZPI279+MFu/py2ULoISd1nnoa0zGz4OW3p0xP2jMjt2cKAU3dodahjwYkN4Et+JYzpDrUAGZ+LctiKT+gXwPzL4vmr14L4NePez3232bwZzJbzkzIJ1/tVYhm/dLSv6IXeVyBPbUytgmXCtS0tz',
    }
}
