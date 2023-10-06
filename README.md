# Script Parrot

1.- Uso del Script

git clone https://github.com/LXRDSZN/parrot_bspwn

cd  parrot_bspwn

chmod +x install.sh

./install.sh

"FULL UPGRADEADO"

Nota:
Para el tema de rofi, al ejecutar el comando ./install.sh aparecera un cuadro
ese tema es rofi, buscar el tema Nord y precionar las teclas alt + a
para ejecutar los comandos

para abrir el menú precionar la tecla windows + d abrirá rofi
que es el menu de programas


para configuarar los atajos de teclado 

*abrir una terminal "windows + enter"
*ir al directorio cd cd .config/sxhkd
*ejecutar el siguiente comando "nano sxhkdrc"


##########################
# wm independent hotkeys #
##########################



#open codium
super + shift + v
	codium
#open genome-center-panel
super + shift + p 
	gnome-control-center
#open nemo
super + shift + n
	nemo
# google-chrome
super + shift + g
	google-chrome
# terminal emulator
super + Return
	/opt/kitty/bin/kitty

# program launcher
super + d
	rofi -show run

# make sxhkd reload its configuration files:
super + Escape
	pkill -USR1 -x sxhkd

#################
# bspwm hotkeys #
#################

# quit/restart bspwm
super + alt + {q,r}
	bspc {quit,wm -r}

# close and kill
super + {_,shift + }w
	bspc node -{c,k}

# alternate between the tiled and monocle layout
super + m
	bspc desktop -l next

# send the newest marked node to the newest preselected node
super + y
	bspc node newest.marked.local -n newest.!automatic.local

# swap the current node and the biggest window
super + g
	bspc node -s biggest.window

###############
# state/flags #
###############

# set the window state
super + {t,shift + t,s,f}
	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

# set the node flags
super + ctrl + {m,x,y,z}
	bspc node -g {marked,locked,sticky,private}

##############
# focus/swap #
##############

# focus the node in the given direction
super + {_,shift + }{Left,Down,Up,Right}
	bspc node -{f,s} {west,south,north,east}

# focus the node for the given path jump
super + {p,b,comma,period}
	bspc node -f @{parent,brother,first,second}

# focus the next/previous window in the current desktop
super + {_,shift + }c
	bspc node -f {next,prev}.local.!hidden.window

# focus the next/previous desktop in the current monitor
super + bracket{left,right}
	bspc desktop -f {prev,next}.local

# focus the last node/desktop
super + {grave,Tab}
	bspc {node,desktop} -f last

# focus the older or newer node in the focus history
super + {o,i}
	bspc wm -h off; \
	bspc node {older,newer} -f; \
	bspc wm -h on

# focus or send to the given desktop
super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '^{1-9,10}'

#############
# preselect #
#############

# preselect the direction
super + ctrl + alt + {Left,Down,Up,Right}
	bspc node -p {west,south,north,east}

# preselect the ratio
super + ctrl + {1-9}
	bspc node -o 0.{1-9}

# cancel the preselection for the focused node
super + ctrl + space
	bspc node -p cancel

# cancel the preselection for the focused desktop
super + ctrl + alt + space
	bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

###############
# move/resize #
###############

# expand a window by moving one of its side outward
#super + alt + {h,j,k,l}
#	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

# contract a window by moving one of its side inward
#super + alt + shift + {h,j,k,l}
#	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

# move a floating window
super + ctrl + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}

# Custom move/resize
super + alt + {Left,Down,Up,Right}
	~/.config/bspwm/scripts/bspwm_resize {west,south,north,east}

########################
# Custom Launchers App #
########################

# Firefox
super + shift + f
	firefox

# BurpSuite
super + shift + b
	burpsuite

###############
# ScreenShots #
###############

@Print
        screenshot select

@Print + ctrl
        screenshot

@Print + alt
        screenshot window



cambio de fondo ir a la carpeta Wallpaper copiar el nombre junto a la extencion ejemplo:
s4vitar.jpg

*ir a la siguiente ruta
*cd  cd .config/bspwm
*ejecutar el comando "nano bspwmrc"

y buscar la siguente lienea 

# WALLPAPER
feh --bg-fill  ~/Wallpaper/hackthebox-alt.jpg

solo cambiar apartir del nombre de la imagen  ejemplo:

feh --bg-fill  ~/Wallpaper/"hackthebox-alt.jpg"

solo cambiamos lo que esta dentrod e las comillas y lo sustituimos por el nombre del nuevo fondo


feh --bg-fill  ~/Wallpaper/nombre-del-fondo.jpg

