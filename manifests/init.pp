class rhel_mrepo_profile(
  $mirror_root   = '/srv/mrepo'
) {

  class { '::staging':
    path  => '/opt/staging',
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }

  class { 'mrepo::params':
    src_root           => $mirror_root,
    www_root           => "${mirror_root}/www",
    user               => 'root',
    group              => 'root',
  }

}
