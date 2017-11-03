# Class to ensure services run at boot.
class services {
    # Run SSHD, requiring the package is installed. Also subscribe to configuration file.
    service { 'sshd' :
        ensure    => running,
        enable    => true,
        subscribe => File['/etc/ssh/sshd_config'],
        require   => Package['openssh-server'],
    }

    # Operating system case to handle variations in common distributions.
    case $::operatingsystem {
        'Debian', 'Ubuntu': {
            # Run Apache, requiring the package is installed and the configuration file is edited. Also subscribe to configuration file.
            service { 'apache2' :
                ensure    => running,
                enable    => true,
                subscribe => File['/etc/apache2/apache2.conf'],
                require   => [Package['httpd'], File_Line['Listen'], File['/var/www/s3481341'],],
            }

            # Run MySQL server, requiring the package is installed. Also subscribe to configuration file.
            service { 'mysqld' :
                ensure    => running,
                enable    => true,
                subscribe => File['/etc/mysql/my.cnf'],
                require   => Package['mysql-server'],
            }
        }
        default: {
            # Run Apache, requiring the package is installed and the configuration file is edited. Also subscribe to configuration file.
            service { 'httpd' :
                ensure    => running,
                enable    => true,
                subscribe => File['/etc/httpd/conf/httpd.conf'],
                require   => [Package['httpd'], File_Line['Listen'], File['/var/www/s3481341'],],
            }

            # Run MySQL server, requiring the package is installed. Also subscribe to configuration file.
            service { 'mysqld' :
                ensure    => running,
                enable    => true,
                subscribe => File['/etc/my.cnf'],
                require   => Package['mysql-server'],
            }
        }
    }
}
