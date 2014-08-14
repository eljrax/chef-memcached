default['memcached']['memory_share'] = 0.75
default['memcached']['port'] = 112_12

# Populate with any custom config in k/v format
default['memcached']['debian']['config']['memcached.conf'] = {
    '#-v' => '',
    '-c' => '500',
    '-M' => '',

}
