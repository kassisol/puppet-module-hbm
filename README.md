# HBM module

Module to manage HBM.

## Compatibility ##

This module is built for use with Puppet v3 on the platforms bellow and supports Ruby versions 1.8.7, 1.9.3, and 2.0.0.

* RedHat 7

===

## Class `hbm` ##

# Parameters
------------

manage_package
--------------
Allows for boolean, 'true', or 'false'

- *Default*: 'false'

manage_service
--------------
Allows for boolean, 'true', or 'false'

- *Default*: 'true'

service_enable
--------------
Allows for boolean, 'true', or 'false'

- *Default*: 'true'

service_ensure
--------------

- *Default*: 'running''

clusters
--------

- *Default*: 'undef'

collections
-----------

- *Default*: 'undef'

configs
-----------

- *Default*: 'undef'

groups
------

- *Default*: 'undef'

hosts
-----

- *Default*: 'undef'

policies
--------

- *Default*: 'undef'

resources
---------

- *Default*: 'undef'

users
-----

- *Default*: 'undef'

clusters_hiera_merge
--------------------
Allows for boolean, 'true', or 'false'

- *Default*: 'false'

collections_hiera_merge
-----------------------
Allows for boolean, 'true', or 'false'

- *Default*: 'false'

configs_hiera_merge
-----------------------
Allows for boolean, 'true', or 'false'

- *Default*: 'false'

groups_hiera_merge
------------------
Allows for boolean, 'true', or 'false'

- *Default*: 'false'

hosts_hiera_merge
-----------------
Allows for boolean, 'true', or 'false'

- *Default*: 'false'

policies_hiera_merge
--------------------
Allows for boolean, 'true', or 'false'

- *Default*: 'false'

resources_hiera_merge
---------------------
Allows for boolean, 'true', or 'false'

- *Default*: 'false'

users_hiera_merge
-----------------
Allows for boolean, 'true', or 'false'

- *Default*: 'false'
