#!/bin/bash

if grep -q 'background_opacity 0.5' ~/.config/kitty/kitty.conf; then
    sed i '' 's/background_opacity 0.5/background_opacity 1/g' ~/.config/kitty/kitty.conf
    echo "listo, opacidad a 1, recarga kitty"
elif grep -q 'background_opacity 1' ~/.config/kitty/kitty.conf; then
    sed i '' 's/background_opacity 1/background_opacity 0.5/g' ~/.config/kitty/kitty.conf
    echo "listo, opacidad a 0.5, recarga kitty"
else
    echo "no hay background_opacity en la config"
fi
