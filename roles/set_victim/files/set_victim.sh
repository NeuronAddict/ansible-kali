#! /usr/bin/env bash

if [[ ${#} -lt 1 ]]
then
  echo "Set victim IP"
  echo "Syntaxe: $0 <IP>"
  exit 0
fi

TO_DELETE="$(sudo ufw status numbered |(grep '192.168.'|awk -F"[][]" '{print $2}'))"

if [[ "$TO_DELETE" != "" ]]
then
        sudo ufw delete "$TO_DELETE"
fi

sudo ufw allow from "$1"

echo "export VICTIM=$1" > ~/.victim

sudo ufw status verbose
