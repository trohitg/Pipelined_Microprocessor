transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Moodle/EE_309/Project2/components.vhd}
vcom -93 -work work {D:/Moodle/EE_309/Project2/controller.vhd}

