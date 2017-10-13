# Class to ensure presense of various packages.
class packages {
    # Ensure presence of bash from package manager, as an assignment dependency. 
    package { 'bash':
        ensure => present,
    }

    # Ensure presence of csh from package manager, as an assignment dependency. 
    package { 'tcsh':
        ensure => present,
    }

    # Ensure presence of wget from package manager, as an assignment dependency. 
    package { 'wget':
        ensure => present,
    }

    # Ensure presence of OpenSSH server from package manager. 
    package { 'openssh-server':
        ensure => present,
    }

    # Operating system case to handle variations in common distributions.
    case $::operatingsystem {
        'Debain', 'Ubuntu': {
            # Ensure presence of OpenSSH client from package manager. 
            package { 'openssh-client':
                ensure => present,
            }

            # Ensure presence of Apache from package manager.
            package { 'apache2':
                ensure => present,
            }

            # Ensure presence of MySQL server from package manager.
            package { 'mysql-server':
                ensure => present,
            }

            # Ensure presence of MySQL client from package manager.
            package { 'mysql-client':
                ensure => present,
            }

            # Ensure presence of VNC server from package manager.
            package { 'vnc4server':
                ensure => present,
                alias  => 'vnc-server',
            }

            # Ensure presence of Dia2Code from package manager.
            package { 'dia2code':
                ensure => present,
            }
        }
        default: {
            # Ensure presence of OpenSSH client from package manager. 
            package { 'openssh':
                ensure => present,
                alias  => 'openssh-client',
            }

            # Ensure presence of Apache from package manager.
            package { 'httpd':
                ensure => present,
                alias  => 'apache2',
            }

            # Ensure presence of package to add MySQL repository.
            package { 'mysql57-community-release-el7-11.noarch' :
                ensure   => 'installed',
                source   => 'https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm',
                provider => 'rpm',
            }

            # Ensure presence of MySQL server from package manager, requiring repository added via package.
            package { 'mysql-community-server':
                ensure  => present,
                require => Package['mysql57-community-release-el7-11.noarch'],
                alias   => 'mysql-server',
            }

            # Ensure presence of MySQL client from package manager.
            package { 'mysql-community-client':
                ensure  => present,
                require => Package['mysql57-community-release-el7-11.noarch'],
                alias   => 'mysql-client',
            }

            # Ensure presence of VNC server from package manager.
            package { 'tigervnc-server':
                ensure => present,
                alias  => 'vnc-server',
            }

            # Ensure installation of Dia2Code from source using rpm.
            package { 'dia2code-0.8.3-1.x86_64':
                ensure   => 'installed',
                source   => 'https://downloads.sourceforge.net/project/dia2code/dia2code/0.8.3/dia2code-0.8.3-1.x86_64.rpm?r=https%3A%2F%2Fsourceforge.net&ts=1507688055&use_mirror=jaist',
                provider => 'rpm',
                alias    => 'dia2code',
            }
        }
    }

    # Ensure presence of tmux from package manager.
    package { 'tmux':
        ensure => present,
    }

    # Ensure presence of Lynx from package manager.
    package { 'lynx':
        ensure => present,
    }

    # Ensure presence of GNU Compiler Collection from package manager.
    package { 'gcc':
        ensure => present,
    }

    # Ensure presence of GNU Debugger from package manager.
    package { 'gdb':
        ensure => present,
    }

    # Ensure presence of CGDB Debugging Interface from package manager.
    package { 'cgdb':
        ensure => present,
    }

    # Ensure presence of vim from package manager.
    package { 'vim':
        ensure => present,
    }

    # Ensure presence of Emacs from package manager.
    package { 'emacs':
        ensure => present,
    }

    # Ensure presence of SSHFS from package manager.
    package { 'sshfs':
        ensure => present,
    }
}
