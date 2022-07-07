onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /branch_tb/tb_clock
add wave -noupdate /branch_tb/tb_reset
add wave -noupdate /branch_tb/tb_op_sys
add wave -noupdate /branch_tb/tb_op_ret
add wave -noupdate /branch_tb/tb_op_jp
add wave -noupdate /branch_tb/tb_op_call
add wave -noupdate /branch_tb/tb_op_sei
add wave -noupdate /branch_tb/tb_op_snei
add wave -noupdate /branch_tb/tb_op_ser
add wave -noupdate -radix hexadecimal /branch_tb/tb_vx_in
add wave -noupdate -radix hexadecimal /branch_tb/tb_vy_in
add wave -noupdate -radix hexadecimal /branch_tb/tb_kk_in
add wave -noupdate -radix hexadecimal /branch_tb/tb_nnn_in
add wave -noupdate -radix hexadecimal /branch_tb/tb_stack_data_in
add wave -noupdate -radix hexadecimal /branch_tb/tb_pc_out
add wave -noupdate -radix hexadecimal /branch_tb/tb_stack_addr
add wave -noupdate -radix hexadecimal /branch_tb/tb_stack_data_out
add wave -noupdate /branch_tb/tb_stack_data_w
add wave -noupdate -divider branch
add wave -noupdate /branch_tb/branch/clock
add wave -noupdate /branch_tb/branch/reset
add wave -noupdate /branch_tb/branch/op_sys
add wave -noupdate /branch_tb/branch/op_ret
add wave -noupdate /branch_tb/branch/op_jp
add wave -noupdate /branch_tb/branch/op_call
add wave -noupdate /branch_tb/branch/op_sei
add wave -noupdate /branch_tb/branch/op_ser
add wave -noupdate /branch_tb/branch/op_snei
add wave -noupdate -radix hexadecimal /branch_tb/branch/vx_in
add wave -noupdate -radix hexadecimal /branch_tb/branch/vy_in
add wave -noupdate -radix hexadecimal /branch_tb/branch/kk_in
add wave -noupdate -radix hexadecimal /branch_tb/branch/nnn_in
add wave -noupdate -radix hexadecimal /branch_tb/branch/stack_data_in
add wave -noupdate -radix hexadecimal /branch_tb/branch/pc_out
add wave -noupdate -radix hexadecimal /branch_tb/branch/stack_addr
add wave -noupdate -radix hexadecimal /branch_tb/branch/stack_data_out
add wave -noupdate /branch_tb/branch/stack_data_w
add wave -noupdate -radix hexadecimal /branch_tb/branch/pc
add wave -noupdate -radix hexadecimal /branch_tb/branch/sp
add wave -noupdate /branch_tb/branch/estado
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {205000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {168154 ps} {337870 ps}
