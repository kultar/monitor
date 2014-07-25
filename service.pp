define monitor::service (
	$service_name = $name,
	$service_description = $name,
	$check_command,
	$check_interval = 3,
	$enable = 1){

	$export_name="${service_name} ${monitor::params::nagiosname}"

    @@nagios_service { "${export_name}":
        use                   => 'generic-service,graphed-service',
        service_description   => ${service_description},
        check_command         => ${check_command},
        normal_check_interval => ${check_interval},
        servicegroups         => 'auto',
        host_name             => $monitor::params::nagiosname,
        contact_groups        => $::group,
        register              => $enable,
    }



	
}