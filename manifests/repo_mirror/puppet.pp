# Mirror Puppet Repos
class rhel_mrepo_profiles::repo_mirror::puppet(
  $update_schedule = 'never',
  $protocol = 'http',
  $versions = ['5','6','7']
)
{
  require ::rhel_mrepo_profiles

  $puppet_mirror  = "${protocol}://yum.puppetlabs.com/el"

  $mirror_root    = $rhel_mrepo_profiles::mirror_root

  $repo_url       = "${puppet_mirror}/\$release/\$repo/\$arch/"

  # We can't use $repo_url for PC1 as it gets downcased somewhere in mrepo...
  $pc1_repo_url   = "${puppet_mirror}/\$release/PC1/\$arch/"

  # To support puppet 3 without future parser don't use an 'each' iterator.
  if member($versions, '5') {
    mrepo::repo { 'puppet-5-x86_64':
      ensure    => present,
      update    => $update_schedule,
      repotitle => 'Puppet $release ($arch)',
      arch      => 'x86_64',
      release   => '5',
      urls      => {
        'products'     => $repo_url,
        'dependencies' => $repo_url,
        'devel'        => $repo_url,
        'PC1'          => $pc1_repo_url,
      },
    }
  }
  if member($versions, '6') {
    mrepo::repo { 'puppet-6-x86_64':
      ensure    => present,
      update    => $update_schedule,
      repotitle => 'Puppet $release ($arch)',
      arch      => 'x86_64',
      release   => '6',
      urls      => {
        'products'     => $repo_url,
        'dependencies' => $repo_url,
        'devel'        => $repo_url,
        'PC1'          => $pc1_repo_url,
      },
    }
  }
  if member($versions, '7') {
    mrepo::repo { 'puppet-7-x86_64':
      ensure    => present,
      update    => $update_schedule,
      repotitle => 'Puppet $release ($arch)',
      arch      => 'x86_64',
      release   => '7',
      urls      => {
        'products'     => $repo_url,
        'dependencies' => $repo_url,
        'devel'        => $repo_url,
        'PC1'          => $pc1_repo_url,
      },
    }
  }
}
