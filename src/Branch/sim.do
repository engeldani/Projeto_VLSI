## cria��o da biblioteca de trabalho.
if {! [ file exists work ] } { 
	echo "Criando biblioteca Work..."
	vlib work
} 


## comando de compila��o.
vcom ./branch.vhd
vcom ./branch_tb.vhd

## comando de simula��o
vsim -voptargs=+acc -wlfdeleteonquit work.branch_tb

## adi��o dos sinais na forma de onda.
#add wave sim:/*
#add wave -divider branch
#add wave sim:/branch/*
do wave.do

## execu��o da simula��o.
run 4 us