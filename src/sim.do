vlib work
vmap work work

#Compila o arquivo
vcom -work work fetch.vhd
vcom -work work fetch_tb.vhd

#Simula o arquivo
#vsim -t 1ns +notimingchecks work.fetch_tb

#do wave.do 

run 1us