# Write out the cached ec2_security_groups value if it doesn't exist already
# Return the cached value if it does

Facter.add("ec2_security_groups_cached") do

  cache_file = "/var/lib/puppet/state/ec2_security_groups"

  if File.exists?(cache_file) and !File.zero?(cache_file)
    id = File.read(cache_file)
    setcode do
      id
    end
  else
    ec2_security_groups = Facter.value(:ec2_security_groups)
    File.open(cache_file, "w+") do |c|
      c.write(ec2_security_groups)
    end
    setcode do
      ec2_security_groups
    end
  end
end