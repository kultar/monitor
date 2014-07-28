define monitor::url(
	$checksource = "local",
	$url,
	$secure = "false"){


	$real_checksource = $checksource ? {
			''      => $target ? {
			'localhost' => 'local',
			'127.0.0.1' => 'local',
			default     => 'remote',
		},
		default => $checksource,
	}

	$http_check_command = $secure ? {
		false	=> "check_http",
		true	=> "check_https",
	}


	$check_command = $real_checksource ? {
		local 	=> "check_nrpe!${http_check_command}! -u ${url}",
		default => "${http_check_command}! -u ${url}",
	}




}