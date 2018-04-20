package { 'git':
          ensure => present,
         }
         
file { '/opt/master_run.txt':
        ensure => present,
        content => "Hello !"
     }
