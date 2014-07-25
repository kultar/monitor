define monitor::port (
  $port,
  $protocol,
  $target,
  $checksource  = '',
  $template     = '',
  $enable=true
  )

  $real_checksource = $checksource ? {
    ''      => $target ? {
      'localhost' => 'local',
      '127.0.0.1' => 'local',
      default     => 'remote',
      },
    default => $checksource,
  }

  # Manage template
  $real_template = $template ? {
    ''      => undef,
    default => $template,
  }


##this a local or a remote check... set up both tcp and udp right meow
  $tcp_check_command = $real_checksource ? {
    local   => "check_nrpe!check_port_tcp!${target}!${port}",
    default => "check_tcp!${port}",
  }

  $udp_check_command = $real_checksource ? {
    local   => "check_nrpe!check_port_udp!${target}!${port}",
    default => "check_udp!${port}",
  }

  $check_command = $protocol ? {
    tcp => $tcp_check_command,
    udp => $udp_check_command,
  }


##export the service now..

	monitor::service { $name:
		check_command => $check_command
	}



	
}