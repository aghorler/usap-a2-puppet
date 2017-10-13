# Class to configure cron.
class cron {
    # Configure puppet agent to check in three times per hour.
    cron { 'puppet-agent':
        ensure  => 'present',
        command => 'opt/puppet/bin/puppet agent --onetime --no-daemonize --splay --splaylimit60',
        minute  => ['20'],
        target  => root,
        user    => root,
    }
}
