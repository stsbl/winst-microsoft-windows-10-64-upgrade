#!/bin/sh

. /usr/lib/iserv/cfg


if [ "$AutoApplyWin10Upgrade" = "1" ]
then
  # Include scipt if option is activated
  cat "/usr/share/iserv/scripts/iservchk/winst-microsoft-windows-10-64-upgrade-apply.templ"
fi
