Facter.add(:disposition) do
  hostname = Facter.value('hostname')
  sg = Facter.value('ec2_security_groups') || sg = ''

  setcode do
    disposition = ''
    if hostname.match(/^\w\w\d\w\-dev.*/) || sg.match(/^\w+\-dev$/)
      'dev'
    elsif hostname.match(/^\w\w\d\w\-demo.*/) || sg.match(/^\w+\-demo$/)
      'demo'
    elsif hostname.match(/^vag.*/)
      'vagrant'
    else
      'prod'
    end
  end
end
