define monitor::process (
	$process,
	$argument	= '',
	$enable		= true,){
	

	$default_check_command = $argument ? {
		undef   => "check_nrpe!check_process!${process}",
		''      => "check_nrpe!check_process!${process}",
		default => "check_nrpe!check_processwitharg!${process}!${argument}",
	}

	$check_command = $process ? {
		undef   => "check_nrpe!check_process!${name}",
		default => $default_check_command,
	}

	##export the service now..
	monitor::service { $name:
		check_command => $check_command
	}


	
}