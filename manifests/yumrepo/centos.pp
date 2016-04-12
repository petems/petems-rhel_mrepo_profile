# Add Yumrepo for CentOS Mirror
class rhel_mrepo_profiles::yumrepo::centos
(
  $mrepo_master,
)
{

  yumrepo { 'centos-base':
    baseurl  => "http://${mrepo_master}/centos-${::operatingsystemmajrelease}-${::architecture}/RPMS.os",
    descr    => "CentOS ${::operatingsystemmajrelease} - base",
    enabled  => 1,
    gpgcheck => 0,
    proxy    => 'absent',
  }

  yumrepo { 'centos-updates':
    baseurl  => "http://${mrepo_master}/centos-${::operatingsystemmajrelease}-${::architecture}/RPMS.updates",
    descr    => "CentOS ${::operatingsystemmajrelease} - updates",
    enabled  => 1,
    gpgcheck => 0,
    proxy    => 'absent',
  }

  yumrepo { 'centos-extras':
    baseurl  => "http://${mrepo_master}/centos-${::operatingsystemmajrelease}-${::architecture}/RPMS.extras",
    descr    => "CentOS ${::operatingsystemmajrelease} - extras",
    enabled  => 1,
    gpgcheck => 0,
    proxy    => 'absent',
  }

}


