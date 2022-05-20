vlib work
vmap work work

#Compila o arquivo
vcom -work work teclado.vhd
vcom -work work testbench.vhd

#Simula o arquivo
vsim -t 1ns +notimingchecks work.testbench

--do wave.do 
run 3us