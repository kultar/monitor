class monitor::config($agent){
	

	file { "${file_path}":
		owner	=> root,
		group	=> root,
		mode	=> '0644',
		content	=> template("monitor/${agent}.conf.erb"),
	}



}


 