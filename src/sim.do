vlib work
vmap work work

vcom -work work decoder.vhd
vcom -work work decoder_tb.vhd

vsim -t 1ns +notimingchecks work.decoder_tb

do wave.do

run 6000ns


