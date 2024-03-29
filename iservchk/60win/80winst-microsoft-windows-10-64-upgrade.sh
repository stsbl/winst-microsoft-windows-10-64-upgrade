#!/bin/bash

. /usr/lib/iserv/cfg

if [ $AutoApplyWin10Upgrade ]
then
  cat << EOT
# apply the upgrade package to all computers that have Windows 10 x64 applied
Test "Apply Microsoft Windows 10 Upgrade x64 to all Windows 10 x64 computers"
  "! psql -Atc \"
    SELECT host_id FROM deploy_state
    WHERE product = 'microsoft-windows-10-64'
      AND host_id NOT IN
        (SELECT host_id FROM deploy_state
        WHERE product = 'microsoft-windows-10-64-upgrade')
    \" iserv postgres | grep -q ."
  "psql -c \"
    INSERT INTO deploy_state (host, host_id, product, action)
    SELECT host, host_id, 'microsoft-windows-10-64-upgrade', 'setup'
    FROM deploy_state
    WHERE product = 'microsoft-windows-10-64'
      AND host_id NOT IN
        (SELECT host_id FROM deploy_state
        WHERE product = 'microsoft-windows-10-64-upgrade');
    \" iserv postgres"

EOT
fi
