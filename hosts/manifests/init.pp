# Class to ensure presence of host entries.
class hosts {
    # Titan RMIT SSH server.
    host { 'titan.csit.rmit.edu.au':
        ip           => '131.170.5.131',
        host_aliases => 'titan',
    }

    # Jupiter RMIT SSH server.
    host { 'jupiter.csit.rmit.edu.au':
        ip           => '131.170.5.135',
        host_aliases => 'jupiter',
    }

    # Saturn RMIT SSH server.
    host { 'saturn.csit.rmit.edu.au':
        ip           => '131.170.5.132',
        host_aliases => 'saturn',
    }
}
