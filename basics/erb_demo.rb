#!/usr/bin/ruby
require 'erb'

ntp_location = 'london'
ntp_mapping = {
    'london' => 'uk.pool.ntp.org',
    'nyc' => 'us.pool.ntp.org'
}

ntp_local_server = '192.138.0.1'
ntp_regional_server = ntp_mapping[ntp_location]
monitor = false

template = ERB.new <<-EOF
# Managed by Puppet - do not edit
server <%= ntp_local_server %> iburst perfer
server <%= ntp_regional_server %>
driftfile /var/lib/ntp/drift
EOF

file = File.read('ntp.conf.erb')
template2 = ERB.new(file)

puts template.result(binding)
puts
puts template2.result(binding)