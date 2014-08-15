memcached Cookbook
==================
The actual cookbook isn't much to hang from the tree, this project is just a skeleton one to use for testing and training of the toolset around Chef development.

This project is set up to work with Vagrant, kitchen, Strainer, serverspec and rspec.

To run the test suite, do:

```
bundle install
bundle exec strainer test
```

Testing
=======
Because I switch doing development on many different machines, the .kitchen.yml file supports both VirtualBox and Docker testing for both CentOS and Ubuntu.
I do quite a bit of development on cloud servers which does not support VirtualBox, so I use docker on those machines, but VirtualBox on my Mac. 
So if your system supports both, you may want to limit kitchen to one platform.
**Remember to update Strainerfile accordingly!**

To test only using VirtualBox
```
bundle exec kitchen test default-ubuntu-1404 default-centos-64
```
To test using only Docker
```
bundle exec kitchen test default-centos-docker default-ubuntu-docker
```

For a list of boxes, run 
```
bundle exec kitchen list
```
