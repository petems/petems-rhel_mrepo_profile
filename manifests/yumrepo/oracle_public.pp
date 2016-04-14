# Restore the base Public Oracle Repos
class rhel_mrepo_profiles::yumrepo::oracle_public
(
)
{

  yumrepo { 'ol7_MySQL55':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/MySQL55/$basearch/',
    descr    => 'MySQL 5.5 for Oracle Linux 7 ($basearch)',
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle',
  }

  yumrepo { 'ol7_MySQL56':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/MySQL56/$basearch/',
    descr    => 'MySQL 5.6 for Oracle Linux 7 ($basearch)',
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle',
  }

  yumrepo { 'ol7_UEKR3':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/UEKR3/$basearch/',
    descr    => 'Latest Unbreakable Enterprise Kernel Release 3 for Oracle Linux $releasever ($basearch)',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle',
  }

  yumrepo { 'ol7_UEKR3_OFED20':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/UEKR3_OFED20/$basearch/',
    descr    => 'OFED supporting tool packages for Unbreakable Enterprise Kernel on Oracle Linux 7 ($basearch)',
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle',
    priority => '20',
  }

  yumrepo { 'ol7_addons':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/addons/$basearch/',
    descr    => 'Oracle Linux $releasever Add ons ($basearch)',
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle',
  }

  yumrepo { 'ol7_latest':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/latest/$basearch/',
    descr    => 'Oracle Linux $releasever Latest ($basearch)',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle',
  }

  yumrepo { 'ol7_optional_latest':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/optional/latest/$basearch/',
    descr    => 'Oracle Linux $releasever Optional Latest ($basearch)',
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle',
  }

  yumrepo { 'ol7_spacewalk22_client':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/spacewalk22/client/$basearch/',
    descr    => 'Spacewalk Client 2.2 for Oracle Linux 7 ($basearch)',
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle',
  }

  yumrepo { 'ol7_u0_base':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/0/base/$basearch/',
    descr    => 'Oracle Linux $releasever GA installation media copy ($basearch)',
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle',
  }

  yumrepo { 'ol7_u1_base':
    ensure   => 'present',
    baseurl  => 'http://public-yum.oracle.com/repo/OracleLinux/OL7/1/base/$basearch/',
    descr    => 'Oracle Linux $releasever Update 1 installation media copy ($basearch)',
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle'
  }


}


