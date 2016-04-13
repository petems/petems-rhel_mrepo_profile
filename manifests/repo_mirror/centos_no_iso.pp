# Mirror CentOS Repos
class rhel_mrepo_profiles::repo_mirror::centos_no_iso(
  $update_schedule = 'never',
)
{

  require rhel_mrepo_profiles

  $mirror_root    = $rhel_mrepo_profiles::mirror_root

  ##############################################################################
  # CentOS 7.0
  ##############################################################################

  mrepo::repo { 'centos7-x86_64':
    ensure    => present,
    update    => $update_schedule,
    repotitle => 'CentOS 7.x x64 bit',
    arch      => 'x86_64',
    release   => '7',
    urls      => {
      os          => 'rsync://mirrors.kernel.org/centos/$release/$repo/$arch/',
      extras      => 'rsync://mirrors.kernel.org/centos/$release/$repo/$arch/',
      cr          => 'rsync://mirrors.kernel.org/centos/$release/$repo/$arch/',
      updates     => 'rsync://mirrors.kernel.org/centos/$release/$repo/$arch/',
    }
  }

  ##############################################################################
  # CentOS 6
  ##############################################################################

  mrepo::repo { 'centos6-x86_64':
    ensure    => present,
    update    => $update_schedule,
    repotitle => 'CentOS 6.x 64 bit',
    arch      => 'x86_64',
    release   => '6',
    urls      => {
      os          => 'rsync://mirrors.kernel.org/centos/$release/$repo/$arch/',
      extras      => 'rsync://mirrors.kernel.org/centos/$release/$repo/$arch/',
      scl         => 'rsync://mirrors.kernel.org/centos/$release/SCL/$arch/',
      updates     => 'rsync://mirrors.kernel.org/centos/$release/$repo/$arch/',
    }
  }

}
