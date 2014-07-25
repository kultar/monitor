define monitor::host {
	

    @@nagios_host { "${monitor::params::nagiosname}":
        ensure         => present,
        alias          => ${monitor::params::nagiosname},
        address        => $ipaddress,
        hostgroups     => $::group,
        use            => 'generic-host',
        contact_groups => $::group,
    }



	
}