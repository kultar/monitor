monitor
=======


Author: Kanwar Gill

License: Apache 2.0

Original Repo: http://github.com/kultar/monitor


Available checks:

 - type: monitor::process
   values:
     {process_name}:
        process: {process or process string}


 - type: monitor::port
   values:
     {port_name}:
        port: {port number}
        protocol: {tcp or udp}
        target: {local or remote, default to remote if not provided}


