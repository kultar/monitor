class monitor::config($agent){
	
	$file_path = $agent ? {
		nrpe 	=> "/etc/nagios/nrpe.cfg",
		snmp	=> "/etc/snmp/snmpd.conf",
	}


	file { "${file_path}":
		owner	=> root,
		group	=> root,
		mode	=> '0644',
		content	=> template("monitor/${agent}.conf.erb"),
	}

	if $agent == "nrpe"{
		file { "/etc/nagios/nrpe.d/default_checks.conf":
			owner	=> root,
			group	=> root,
			mode	=> '0644',
			content	=> template("monitor/default_checks.conf.erb")
		}
	}


}


 