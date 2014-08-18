# encoding: utf-8
default['memcached']['memory_share'] = 0.75
default['memcached']['port'] = 112_12

# Populate with any custom config in k/v formati for debian platforms
default['memcached']['debian']['config']['memcached.conf'] = {
  '#-v' => '',
  '-c' => '500',
  '-M' => '',
  '-t' => '6'
}

# Populate with any custom config in k/v formati for RedHat platforms
default['memcached']['rhel']['config']['memcached.conf'] = {
  'OPTIONS=' => '"-t 6 -r"'
}
