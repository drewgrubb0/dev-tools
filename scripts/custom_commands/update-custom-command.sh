#!/bin/bash
cp "$PWD/.custom_commands/$1.sh" "$(echo ~)/.custom_commands/$1.sh"
cat source "$(echo ~)/.custom_commands/$1.sh" >> $(echo ~)/.bashrc