# rhel_mrepo_profiles

#### Table of Contents

1. [Overview](#overview)
1. [Setup - The basics of getting started with rhel_mrepo_profiles](#setup)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Extremley opinionated way of mirroring RHEL-ish Yum repos:

* EPEL
* CentOS
* Oracle Linux

## Setup

### What rhel_mrepo_profiles affects

* mrepo mirrors
* apache config for mrepo
* yumrepo config files to point to those mirrors

### Beginning with rhel_mrepo_profiles

```puppet
include ::rhel_mrepo_profiles
include ::rhel_mrepo_profiles::epel
```

## Limitations

Only supports EL6 and EL7 flavours, only on x86_64
