#!/bin/bash

wlaninterface=wlan1mon

function sharkSkim {
tshark -i wlan1mon -Y'wlan.fc.type_subtype eq 4' -E separator=\| -E header=y -T  fields -e frame.time -e wlan.sa_resolved -e wlan.sa -e wlan_mgt.ssid -e radiotap.dbm_antsignal > wifiskim.dump
}

function channelHop {
  while true
  do
    for channel in {1..12}
    do
      echo ${wlaninterface} ${channel}
      iwconfig ${wlaninterface} channel ${channel}
      sleep 5
    done
  done
}

channelHop &
sharkSkim
