#!/usr/bin/env bash

# path: ~/.config/polybar/launch.sh

polybar-msg cmd quit
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar baz 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bar launched..."
