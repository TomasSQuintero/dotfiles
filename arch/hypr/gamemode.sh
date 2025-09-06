#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$HYPRGAMEMODE" = 1 ] ; then
    # Activar modo juego: deshabilitar animaciones, quitar gaps y matar waybar
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword decoration:rounding 0"
    
    # Matar waybar
    killall waybar
    exit
fi

# Desactivar modo juego: recargar config y reiniciar waybar
hyprctl reload

# Reiniciar waybar
waybar &

# HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
# if [ "$HYPRGAMEMODE" = 1 ] ; then
#     hyprctl --batch "\
#         keyword animations:enabled 0;\
#         keyword general:gaps_in 0;\
#         keyword general:gaps_out 0;\
#         keyword decoration:rounding 0"
#     exit
# fi
# hyprctl reload
