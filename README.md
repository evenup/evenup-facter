What is it?
===========

A Puppet module that installs facter and sets needed environment variables.

Released under the Apache 2.0 licence

Usage:
------

To install:
<pre>
  include facter
</pre>

Note:
-----
On RHEL 6.4 based machines redhat-lsb-core is used rather than redhat-lsb
due to the large number of dependencies with redhat-lsb.

Contribute:
-----------
* Fork it
* Create a topic branch
* Improve/fix (with spec tests)
* Push new topic branch
* Submit a PR
