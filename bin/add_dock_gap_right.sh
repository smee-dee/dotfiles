#!/bin/bash

defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}' 
killall -9 Dock
