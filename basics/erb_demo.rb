#!/usr/bin/ruby
require 'erb'

ntp_location = 'london'
ntp_mapping = {
    'london' => 'uk.pool.ntp.org',
    'nyc' => 'us.pool.ntp.org'
}
ntp_local_server = '192.138.0.1'
ntp_regional_server = ntp_mapping[ntp_location]

template = ERB.new <<-EOF
# Managed by Puppet - do not edit
server <%= ntp_local_server %> iburst perfer
server <%= ntp_regional_server %>
driftfile /var/lib/ntp/drift
EOF

puts template.result(binding)