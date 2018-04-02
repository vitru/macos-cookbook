if node['platform_version'].match? Regexp.union ['10.12', '10.13']
  execute 'Disable Gatekeeper' do
    command ['spctl', '--master-disable']
  end

  include_recipe 'macos::xcode'

elsif node['platform_version'].match? Regexp.union '10.11'

  xcode '8.2.1' do
    ios_simulators %w(10 9)
  end
end
