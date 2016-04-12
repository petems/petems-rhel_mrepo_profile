# Mirror EPEL Repos
class rhel_mrepo_profiles::repo_mirror::rpmforge {

  require rhel_mrepo_profiles

  $mirror_root      = $rhel_mrepo_profiles::mirror_root

  $rpmforge_mirror  = 'http://apt.sw.be/redhat/'

  $rpmforge_url         = "${rpmforge_mirror}/el\$release/en/\$basearch/rpmforge"

  ##############################################################################
  # RPMForge 7
  ##############################################################################

  mrepo::repo { 'rpmforge-7-x86_64':
    ensure    => present,
    repotitle => 'RHEL $releasever - RPMforge.net - dag',
    arch      => 'x86_64',
    release   => '7',
    hour      => '4',
    urls      => {
      rpmforge => $rpmforge_url,
    },
  }


  ##############################################################################
  # RPMForge 6
  ##############################################################################

  mrepo::repo { 'rpmforge-6-x86_64':
    ensure    => present,
    repotitle => 'RHEL $releasever - RPMforge.net - dag',
    arch      => 'x86_64',
    release   => '6',
    hour      => '4',
    urls      => {
      rpmforge => $rpmforge_url,
    },
  }

}
