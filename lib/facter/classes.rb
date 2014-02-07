# classes.rb

Facter.add("classes") do
  setcode do
    File.open('/var/lib/puppet/classes.txt').read.split.sort.join(",").chomp
  end
end
