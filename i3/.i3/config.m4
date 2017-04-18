m4_divert(-1)
m4_changequote(`‹', `›')
m4_divert(0)
#
#	¯\_(ツ)_/¯
#
# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

m4_dnl # on tanaris super key (meta4) is waay over there
set $mod Mod1

exec --no-startup-id xsetroot -solid "#002b36"
m4_dnl # on tanaris caps-esc remap is done in keyboard controller
m4_ifelse(HOSTNAME, ‹tanaris›, ‹›, ‹
exec --no-startup-id xmodmap ~/.x-capsmagick
›)
exec --no-startup-id compton -b --config ~/.config/compton.conf
exec --no-startup-id xscreensaver -no-splash
exec --no-startup-id redshift-gtk

font xft:Inconsolata 8

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+Shift+q kill

bindsym $mod+d exec rofi -show run -lines 3 -eh 2 -opacity "85" -bw 0
bindsym $mod+c exec --no-startup-id google-chrome-beta --show-app-list

bindsym $mod+z exec xscreensaver-command --lock
m4_ifelse(HOSTNAME, ‹felwood›, ‹
# Rotate display 90 deg
bindsym XF86TaskPane	exec thinkpad-rotate
# Touchpad controls
bindsym XF86TouchpadToggle exec /some/path/toggletouchpad.sh # toggle touchpad
›)

for_window [instance="chrome_app_list" window_role="bubble"] floating enable
for_window [class="shutter" instance="Shutter"] floating enable # huh -- not working

## screenshots using shutter
# default full screen capture
bindsym Print exec shutter --full
# active window capture
bindsym Shift+Print exec shutter --active
# selection capture
bindsym Mod1+Print exec shutter --select


# multimedia keys
bindsym XF86AudioRaiseVolume exec --no-startup-id amixer -q set Master 2%+ unmute && killall -SIGUSR1 i3status
bindsym XF86AudioLowerVolume exec --no-startup-id amixer -q set Master 2%- unmute && killall -SIGUSR1 i3status
bindsym XF86AudioMute exec --no-startup-id amixer -q set Master toggle && killall -SIGUSR1 i3status

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness


# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# split in horizontal orientation
bindsym $mod+b split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split


bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10


# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

new_window pixel 1
new_float pixel 1

hide_edge_borders both

mode "resize" {
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"


focus_follows_mouse no

bar {
    status_command	i3status
    position		bottom
    mode		dock
    workspace_buttons	yes
    tray_output		primary
    font		xft:Inconsolata Medium 10

    # nice solarized dark theme colours
    colors {
	    background		#002b36
	    statusline		#839496
	    separator		#586e75
	    focused_workspace	#b58900 #b58900 #002b36
	    active_workspace	#586e75 #586e75 #002b36
	    inactive_workspace	#073642 #002b36 #839496
	    urgent_workspace	#dc322f #dc322f #fdf6e3
    }
}

client.focused		#002b36 #586e75 #fdf6e3 #268bd2
client.focused_inactive	#002b36 #073642 #839496 #073642
client.unfocused	#002b36 #073642 #839496 #073642
client.urgent		#002b36 #dc322f #fdf6e3 #002b36

