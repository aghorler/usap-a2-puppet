# Class to perform various configurations to services and the operating system.
class configuration {
    # Add sshd_config to catalog, for service subscription.
    file {'/etc/ssh/sshd_config':
        ensure  => present,
        require => Package['openssh-server'],
    }

    # Disable root logins via SSH, requiring OpenSSH server is installed.
    file_line{ 'PermitRootLogin':
        path    => '/etc/ssh/sshd_config',
        replace => true,
        line    => 'PermitRootLogin No',
        match   => '^PermitRootLogin',
        require => Package['openssh-server'],
    }

    # Create DocumentRoot directory for Apache.
    file { '/var/www/s3481341':
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }

    # Operating system case to handle variations in common distributions.
    case $::operatingsystem {
        'Debain', 'Ubuntu': {
            # Add apache2.conf to catalog, for service subscription.
            file {'/etc/apache2/apache2.conf':
                ensure  => present,
                require => Package['httpd'],
            }

            # Add my.cnf to catalog, for service subscription.
            file {'/etc/mysql/my.cnf':
                ensure  => present,
                require => Package['mysql-server'],
            }

            # Change listening port for Apache, requiring Apache is installed.
            file_line { 'Listen':
                path    => '/etc/apache2/apache2.conf',
                replace => true,
                line    => 'Listen 8888',
                match   => '^Listen',
                require => Package['httpd'],
            }

            # Change DocumentRoot for Apache, requiring Apache is installed.
            file_line { 'DocumentRoot':
                path    => '/etc/apache2/sites-available/000-default.conf',
                replace => true,
                line    => 'DocumentRoot "/var/www/s3481341"',
                match   => '^DocumentRoot',
                require => Package['httpd'],
            }
        }
        default: {
            # Add httpd.conf to catalog, for service subscription.
            file {'/etc/httpd/conf/httpd.conf':
                ensure  => present,
                require => Package['httpd'],
            }

            # Add my.cnf to catalog, for service subscription.
            file {'/etc/my.cnf':
                ensure  => present,
                require => Package['mysql-server'],
            }

            # Change listening port for Apache, requiring Apache is installed.
            file_line { 'Listen':
                path    => '/etc/httpd/conf/httpd.conf',
                replace => true,
                line    => 'Listen 8888',
                match   => '^Listen',
                require => Package['httpd'],
            }

            # Change DocumentRoot for Apache, requiring Apache is installed.
            file_line { 'DocumentRoot':
                path    => '/etc/httpd/conf/httpd.conf',
                replace => true,
                line    => 'DocumentRoot "/var/www/s3481341"',
                match   => '^DocumentRoot',
                require => Package['httpd'],
            }
        }
    }

    # Manually add becca to the sudoers file.
    file_line { 'becca-sudo':
        path => '/etc/sudoers',
        line => 'becca ALL = (ALL)ALL',
    }

    # Set default run level to 3.
    exec { 'runlevel':
        command => '/usr/bin/systemctl set-default multi-user.target',
    }

    # Set the timestamp to client
    file { '/etc/profile.d/usap-timestamp.sh':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => 'timeStamp=`/usr/bin/date + "%d-%m-%Y_%H.%M.%S"`; echo "Agent started running at $timeStamp"',
    }

    # Include /usr/local/bin to user
    file {'/etc/profile.d/usap-path.sh':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => 'PATH=$PATH:/usr/local/bin',
    }

    # Mount my RMIT titan home directory over SSHFS in becca's home directory.
    #exec {'mount-titan':
    #    command => '/usr/bin/mkdir /home/becca/titan && echo "secret" | /usr/bin/sshfs s3481341@titan:/home/sl1/s3481341 /home/becca/titan -o password_stdin',
    #    unless  => '/usr/bin/find /home/becca/titan -mindepth 1 | read',
    #    require => [User['becca'],],
    #}
}
