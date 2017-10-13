# Class to ensure presence of groups.
class groups {
    # Create sysadmin group.
    group { 'sysadmin':
        ensure => present,
    }

    # Create trucks group.
    group { 'trucks':
        ensure => present,
    }

    # Create cars group.
    group { 'cars':
        ensure => present,
    }

    # Create ambulances group.
    group { 'ambulances':
        ensure => present,
    }
}
