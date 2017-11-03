# Class to ensure users exist.
class users {
    # Create becca user.
        user { 'becca':
        ensure     => present,
        uid        => 10011341,
        password   => '$1$f9JOFEfC$g8oKpdmGas2Zc9kSdr37I/',
        home       => '/home/becca',
        managehome => true,
        groups     => ['sysadmin', 'cars'],
        shell      => '/bin/bash',
        require    => [Group['sysadmin'], Group['cars'],],
    }

    # Operating system case to handle variations in common distributions.
    case $::operatingsystem {
        'Debian', 'Ubuntu': {
            # Create fred user.
            user { 'fred':
                ensure     => present,
                uid        => 10021341,
                password   => '$1$f9JOFEfC$g8oKpdmGas2Zc9kSdr37I/',
                home       => '/home/fred',
                managehome => true,
                groups     => ['trucks', 'cars', 'sudo'],
                shell      => '/bin/csh',
                require    => [Group['trucks'], Group['cars'],],
            }
        }
        default: {
            # Create fred user.
            user { 'fred':
                ensure     => present,
                uid        => 10021341,
                password   => '$1$f9JOFEfC$g8oKpdmGas2Zc9kSdr37I/',
                home       => '/home/fred',
                managehome => true,
                groups     => ['trucks', 'cars', 'wheel'],
                shell      => '/bin/csh',
                require    => [Group['trucks'], Group['cars'],],
            }
        }
    }

    # Create wilma user.
        user { 'wilma':
        ensure         => present,
        uid            => 10031341,
        password       => '$1$f9JOFEfC$g8oKpdmGas2Zc9kSdr37I/',
        home           => '/home/wilma',
        managehome     => true,
        groups         => ['trucks', 'cars', 'ambulances'],
        purge_ssh_keys => true,
        require        => [Group['trucks'], Group['cars'], Group['ambulances'],],
    }

    # Create authorised public key for wilma.
    ssh_authorized_key { 'wilma@puppet.aaronhorler.com':
        ensure  => present,
        user    => 'wilma',
        type    => 'ssh-rsa',
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDnIRFMK/zP7j7xYIixyUYrBW+dywM3H3XFEOJ7x39rt+8pL13ZeL/n7M+GnxDbSii0MC94Tv2Ie5en2x+jV5NXr+2kypcSNshTwkqSOSDC+ujzi4PPxdA2LQswhPp6lvwpPTcks4aWKxRizO/MZRtz9jd5XGic+hhvKg609wO9yyRdYt20muMz/v473uT5vw069T4JzIRDMrU3NxwJQlBE/mfP/6yoX/uJfCKTpG3C32i/YZulRvigo90XM6NJefe5Lj8rdh8uvJnCUKqlTQPDyF08TMQvCHzIPwO3tu1I7z8OLuBMvZ83oa3MKJqZwoz7L37Xejwxq1kAoeDqcIZl',
        require => User['wilma'],
    }
}
