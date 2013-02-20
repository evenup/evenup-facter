# classes.rb

Facter.add("classes") do
  setcode do
    File.open('/var/lib/puppet/classes.txt').read.split.join(",").chomp
  end
end