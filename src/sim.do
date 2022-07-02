vlib work
vmap work work

#Compila o arquivo
vcom -work work alu.vhd
vcom -work work teclado.vhd
vcom -work work testbench.vhd

#Simula o arquivo
vsim -t 1ns  -voptargs=+acc work.testbench

--do wave.do 
run 3us
