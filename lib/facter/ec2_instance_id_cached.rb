# Write out the cached ec2_instance_id value if it doesn't exist already
# Return the cached value if it does

Facter.add("ec2_instance_id_cached") do

  cache_file = "/var/lib/puppet/state/ec2_instance_id"

  if File.exists?(cache_file) and !File.zero?(cache_file)
    id = File.read(cache_file)
    setcode do
      id
    end
  else
    ec2_instance_id = Facter.value(:ec2_instance_id)
    File.open(cache_file, "w+") do |c|
      c.write(ec2_instance_id)
    end
    setcode do
      ec2_instance_id
    end
  end
end