class monitor::params{
	

	##the name that will be exported to storedconfigs for nagios checks
	$nagiosname = $::fqdn



	# NRPE configs

	## nagios username and group
	$nagios_user = "nagios"
	$nagios_group = "nagios"


	## nrpe port to listen on
	$nrpe_server_port = "5666"

	## blame nrpe?
	#### set to 1 to allow arguments
	#### set to 0 to disallow arguments
	$nrpe_blame = "1"

	## debug
	$nrpe_debug = "0"



}