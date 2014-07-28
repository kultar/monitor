class monitor{
	
	## class specific params
	include monitor::params

	## basic checks
	include monitor::base_checks
	
	## enable the agent
	include monitor::package

}