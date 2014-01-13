# Class: facter
#
# This module manages facter
#
# Sample Usage:
# include facter
#
class facter {

  if versioncmp("${::lsbdistrelease}", '6.3') > 0 {
    package { 'redhat-lsb-core':
      ensure  => 'installed',
    }
  } else {
    package { 'redhat-lsb':
      ensure  => 'installed',
    }
  }

  package { 'virt-what':
    ensure  => 'installed',
  }

  package { 'facter':
    ensure  => '1.7.0-1.el6',
  }

  file { '/etc/facts.d':
    ensure  => 'directory',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0555',
  }

  # TODO - there needs to be a better way to get facter facts to work
  # This is a modified version of the ec2.rb file that comes with 1.6.17
  # Supposed to be fixed in facter 2.0.0: http://projects.puppetlabs.com/issues/7559
  file { '/usr/lib/ruby/site_ruby/1.8/facter/ec2.rb':
    ensure  => file,
    mode    => '0444',
    owner   => root,
    group   => root,
    require => Package['facter'],
    source  => 'puppet:///modules/facter/ec2.rb',
  }

  # Ensure all facter facts are available at the CLI by setting the environment
  # variable FACTERLIB
  file { '/etc/profile.d/facter.sh':
    ensure  => present,
    mode    => '0444',
    content => "# Managed by puppet - do not modify\nexport FACTERLIB=/var/lib/puppet/lib\n",
  }
}


