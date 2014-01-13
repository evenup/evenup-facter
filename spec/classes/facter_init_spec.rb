require 'spec_helper'

describe 'facter', :type => :class do

  context "when called with default parameters" do

    it { should create_class('facter') }

    it { should create_package('redhat-lsb') }
    it { should create_package('virt-what') }
    it { should create_package('facter').with_ensure('1.7.0-1.el6') }

    it { should create_file('/etc/facts.d').with(
      'ensure'  => 'directory'
    ) }

    it { should create_file('/usr/lib/ruby/site_ruby/1.8/facter/ec2.rb') }

  end

  context 'on RHEL6.3 based machines' do
    context 'on RHEL 6.4 based machines' do
      let(:facts) { { :lsbdistrelease => 6.3 } }
      it { should contain_package('redhat-lsb') }
    end
  end

  context 'on RHEL 6.4 based machines' do
    let(:facts) { { :lsbdistrelease => 6.4 } }
    it { should contain_package('redhat-lsb-core') }
  end

end

