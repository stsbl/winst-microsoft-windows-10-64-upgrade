#!/bin/sh

. /usr/lib/iserv/cfg

echo "[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]"
if [ "$HoldBackWin10Upgrades" = "1" ]
then
  echo "; Windows 10 Upgrades drei Monate zurückhalten"
  echo '"DeferUpgrade"=dword:1'
else
  echo "; Zurückhaltungseinstellungen zurücksetzen"
  echo '"DeferUpgrade"=-'
fi
