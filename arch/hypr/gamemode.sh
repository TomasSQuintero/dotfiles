#!/usr/bin/env sh
#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword decoration:rounding 0;\
        keyword general:border_size 2;\
        keyword general:col.active_border 0xffF1BE9B;\
        keyword general:col.inactive_border 0xff666666"
    exit
fi
hyprctl reload
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
