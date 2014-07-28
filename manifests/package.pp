class monitor::package ($agent = "nrpe"){
	
	## get the appropriate package and service names
	$package_name = $agent ? {
		nrpe 	=> "nrpe",
		snmp	=> "net-snmp",
	}
	$service_name = $agent ? {
		nrpe	=> "nrpe",
		snmp 	=> "snmpd",
	}



	## install the appropriate package
	package { $package_name:
		ensure	=> latest,
	}

	service { $service_name:
		ensure	=> running,
	}

	## get the appropriate config in place
	include monitor::config($agent)



}