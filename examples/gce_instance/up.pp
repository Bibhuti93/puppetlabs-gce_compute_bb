gce_network { 'puppet-test-instance-network':
  ensure       => present,
  description  => "Network for testing the puppetlabs-gce_compute module instances"
}

gce_instance { 'puppet-test-instance':
  ensure             => present,
  zone               => 'us-central1-a',
  description        => "Instance for testing the puppetlabs-gce_compute module",
  image              => 'coreos',
  machine_type       => 'f1-micro',
  network            => 'puppet-test-instance-network',
  maintenance_policy => 'TERMINATE',
  can_ip_forward     => true,
  tags               => ['tag1','tag2'],
  metadata           => {test-metadata-key => 'test-metadata-value'},
  startup_script     => '../examples/gce_instance/example-startup-script.sh'
}

gce_disk { 'puppet-test-instance-from-disk-disk':
  ensure       => present,
  zone         => 'us-central1-a',
  description  => "Disk for testing the puppetlabs-gce_compute module instance started from a disk",
  size         => 10,
  image        => 'coreos'
}

gce_instance { 'puppet-test-instance-from-disk':
  ensure              => present,
  zone                => 'us-central1-a',
  description         => "Instance for testing the puppetlabs-gce_compute module instance started from a disk",
  boot_disk           => 'puppet-test-instance-from-disk-disk'
}
