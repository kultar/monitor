class monitor::base_checks{

## default check for all OS' are
#### ping

	monitor::service { "${monitor::params::nagiosname}_check_ping":
		check_command => "check_ping!200.0,30%!500.0,60%"
	}




## default linux checks are	
#### load
#### memory
#### swap
#### disk space
#### filesystem


	if ($::kernel == "linux" ){

		monitor::service { "${monitor::params::nagiosname}_nrpe_load":
			check_command => "check_nrpe!check_load"
		}

		monitor::service { "${monitor::params::nagiosname}_nrpe_mem":
			check_command => "check_nrpe!check_mem"
		}

		monitor::service { "${monitor::params::nagiosname}_nrpe_swap":
			check_command => "check_nrpe!check_swap"
		}

		monitor::service { "${monitor::params::nagiosname}_nrpe_disk_space":
			check_command => "check_nrpe!check_disk_space"
		}

		monitor::service { "${monitor::params::nagiosname}_nrpe_filesystems":
			check_command => "check_nrpe!check_filesystems"
		}

	} ##if

## default windows checks are
#### load  
#### memory 
#### uptime  
#### disk space c:\   

	if ($::kernel == "windows" ){

		monitor::service { "${monitor::params::nagiosname}_checknt_load":
			check_command => "check_nt!CPULOAD!-l 5,80,90"
		}

		monitor::service { "${monitor::params::nagiosname}_checknt_memory":
			check_command => "check_nt!MEMUSE!-w 80 -c 90"
		}

		monitor::service { "${monitor::params::nagiosname}_checknt_uptime":
			check_command => "check_nt!UPTIME"
		}

		monitor::service { "${monitor::params::nagiosname}_checknt_diskspace_c":
			check_command => "check_nt!USEDDISKSPACE!-l c -w 80 -c 90"
		}


	} ##if




}