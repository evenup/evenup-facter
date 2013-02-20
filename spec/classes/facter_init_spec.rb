require 'spec_helper'

describe 'facter', :type => :class do

  context "when called with default parameters" do

    it { should create_class('facter') }

    it { should create_package('redhat-lsb') }
    it { should create_package('virt-what') }
    it { should create_package('facter').with_ensure('1.6.17-1.el6') }

    it { should create_file('/etc/facts.d').with(
      'ensure'  => 'directory'
    ) }

    it { should create_file('/usr/lib/ruby/site_ruby/1.8/facter/ec2.rb') }

  end

end

