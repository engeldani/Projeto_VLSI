vlib work
vmap work work

vcom -work work decoder_tb
vcom -work work decoder

vsim -t 1ns +notimingchecks work.decoder_tb
vsim -t 1ns +notimingchecks work.decoder

run 6000ns


