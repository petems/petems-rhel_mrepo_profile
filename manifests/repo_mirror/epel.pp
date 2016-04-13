# Mirror EPEL Repos
class rhel_mrepo_profiles::repo_mirror::epel {

  require rhel_mrepo_profiles

  $mirror_root      = $rhel_mrepo_profiles::mirror_root

  $epel_mirror      = 'rsync://rsync.mirrorservice.org/dl.fedoraproject.org/pub/'

  $epel_url         = "${epel_mirror}/\$repo/\$release/\$arch/"

  ##############################################################################
  # EPEL 7
  ##############################################################################

  mrepo::repo { 'epel-7-x86_64':
    ensure    => present,
    repotitle => 'EPEL $release ($arch) Latest',
    arch      => 'x86_64',
    release   => '7',
    hour      => '4',
    urls      => {
      epel => $epel_url,
    },
  }


  ##############################################################################
  # EPEL 6
  ##############################################################################

  mrepo::repo { 'epel-6-x86_64':
    ensure    => present,
    repotitle => 'EPEL $release ($arch) Latest',
    arch      => 'x86_64',
    release   => '6',
    hour      => '4',
    urls      => {
      epel => $epel_url,
    },
  }

}
