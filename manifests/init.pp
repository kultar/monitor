class monitor{
	
	## class specific params
	include monitor::params

	## basic checks
	include monitor::base_checks
	
	## enable the agent - if you want to use snmp, pass "snmp" instead of "nrpe"
	include monitor::package("nrpe")

}