Facter.add(:disposition) do
  hostname = Facter.value('hostname')
  sg = Facter.value('ec2_security_groups') || sg = ''

  setcode do
    disposition = ''
    if hostname.match(/^\w\w\d\w\-dev.*/) || sg.match(/^\w+\-dev$/) || sg.match(/^\w+\-loadtesting$/)
      'dev'
    elsif hostname.match(/^\w\w\d\w\-demo.*/) || sg.match(/^\w+\-demo$/)
      'demo'
    elsif hostname.match(/^\w\w\d\w\-qa.*/) || sg.match(/^\w+\-qa$/)
      'qa'
    elsif hostname.match(/^\w\w\d\w\-test.*/) || sg.match(/^\w+\-test$/)
      'test'
    elsif hostname.match(/^vag.*/)
      'vagrant'
    else
      'prod'
    end
  end
end
