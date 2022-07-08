## criação da biblioteca de trabalho.
if {! [ file exists work ] } { 
	echo "Criando biblioteca Work..."
	vlib work
} 


## comando de compilação.
vcom ./branch.vhd
vcom ./branch_tb.vhd

## comando de simulação
vsim -voptargs=+acc -wlfdeleteonquit work.branch_tb

## adição dos sinais na forma de onda.
#add wave sim:/*
#add wave -divider branch
#add wave sim:/branch/*
do wave.do

## execução da simulação.
run 4 us