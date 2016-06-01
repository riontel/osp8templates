#!/bin/bash

openstack overcloud deploy --templates \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/templates/scheduler_hints_env.yaml \
-e /home/stack/templates/network-environment.yaml \
-e /home/stack/templates/storage-environment.yaml \
-e /home/stack/templates/rhel-registration/environment-rhel-registration.yaml \
-e /home/stack/templates/rhel-registration/rhel-registration-resource-registry.yaml \
--control-flavor baremetal --compute-flavor baremetal --ceph-storage-flavor baremetal \
--compute-scale 2 --control-scale 3  --ceph-storage-scale 3 --block-storage-scale 0 --swift-storage-scale 0 \
--libvirt-type kvm \
--ntp-server 172.31.60.20 \
--neutron-network-type vlan \
--neutron-bridge-mappings physnet-external:br-ex,physnet-tenant:br-bond0 \
--neutron-network-vlan-ranges physnet-tenant:1000:1999 \
--neutron-disable-tunneling --timeout 60 \
--verbose --log-file overcloud_new.log 

#--verbose --debug --log-file overcloud_new.log 
#-e /home/stack/templates/rhel-registration/environment-rhel-registration.yaml \
#-e /home/stack/templates/rhel-registration/rhel-registration-resource-registry.yaml \
# DO NOT use https for Satellite registration
#--rhel-reg --reg-method satellite --reg-org Default_Organization --reg-sat-url http://sat6.rolman.net --reg-activation-key osp8 \
#-e /home/stack/templates/ips-from-pool-all.yaml \
