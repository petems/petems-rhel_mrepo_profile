# Install MRepo
class rhel_mrepo_profiles(
  $mirror_root   = '/srv/mrepo',
  $source        = 'git',
  $port          = '80',
) {

  $staging_target = "${mirror_root}/iso"

  class { '::staging':
    path  => '/opt/staging',
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }

  file { $staging_target:
    ensure => directory,
    owner  => apache,
    group  => apache,
    mode   => '0755',
  }

  class { '::mrepo::params':
    source     => $source, # No mrepo el7 package, easier to just clone, specify package on RHEL 6
    ensure_src => 'present', # latest commit as of 11/Apr/16
    src_root   => $mirror_root,
    www_root   => "${mirror_root}/www",
    user       => 'root',
    group      => 'root',
    port       => $port,
  }

  include ::git
  include ::mrepo

  ensure_packages('make')

  Package['make'] -> Class['::git'] -> Class['::mrepo']

}
