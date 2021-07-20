#!/bin/bash
sudo cvt 3840 2160 60
sudo xrandr --newmode "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163 2168 2237 -hsync +vsync
sudo xrandr --addmode Virtual1 "3840x2160_60.00"
