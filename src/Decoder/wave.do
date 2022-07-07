onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /testbench/tb_clock
add wave -noupdate -radix binary /testbench/tb_reset
add wave -noupdate -radix hexadecimal -childformat {{/testbench/tb_opcode_in(15) -radix hexadecimal} {/testbench/tb_opcode_in(14) -radix hexadecimal} {/testbench/tb_opcode_in(13) -radix hexadecimal} {/testbench/tb_opcode_in(12) -radix hexadecimal} {/testbench/tb_opcode_in(11) -radix hexadecimal} {/testbench/tb_opcode_in(10) -radix hexadecimal} {/testbench/tb_opcode_in(9) -radix hexadecimal} {/testbench/tb_opcode_in(8) -radix hexadecimal} {/testbench/tb_opcode_in(7) -radix hexadecimal} {/testbench/tb_opcode_in(6) -radix hexadecimal} {/testbench/tb_opcode_in(5) -radix hexadecimal} {/testbench/tb_opcode_in(4) -radix hexadecimal} {/testbench/tb_opcode_in(3) -radix hexadecimal} {/testbench/tb_opcode_in(2) -radix hexadecimal} {/testbench/tb_opcode_in(1) -radix hexadecimal} {/testbench/tb_opcode_in(0) -radix hexadecimal}} -subitemconfig {/testbench/tb_opcode_in(15) {-radix hexadecimal} /testbench/tb_opcode_in(14) {-radix hexadecimal} /testbench/tb_opcode_in(13) {-radix hexadecimal} /testbench/tb_opcode_in(12) {-radix hexadecimal} /testbench/tb_opcode_in(11) {-radix hexadecimal} /testbench/tb_opcode_in(10) {-radix hexadecimal} /testbench/tb_opcode_in(9) {-radix hexadecimal} /testbench/tb_opcode_in(8) {-radix hexadecimal} /testbench/tb_opcode_in(7) {-radix hexadecimal} /testbench/tb_opcode_in(6) {-radix hexadecimal} /testbench/tb_opcode_in(5) {-radix hexadecimal} /testbench/tb_opcode_in(4) {-radix hexadecimal} /testbench/tb_opcode_in(3) {-radix hexadecimal} /testbench/tb_opcode_in(2) {-radix hexadecimal} /testbench/tb_opcode_in(1) {-radix hexadecimal} /testbench/tb_opcode_in(0) {-radix hexadecimal}} /testbench/tb_opcode_in
add wave -noupdate -radix binary -childformat {{/testbench/tb_nnn_out(11) -radix binary} {/testbench/tb_nnn_out(10) -radix binary} {/testbench/tb_nnn_out(9) -radix binary} {/testbench/tb_nnn_out(8) -radix binary} {/testbench/tb_nnn_out(7) -radix binary} {/testbench/tb_nnn_out(6) -radix binary} {/testbench/tb_nnn_out(5) -radix binary} {/testbench/tb_nnn_out(4) -radix binary} {/testbench/tb_nnn_out(3) -radix binary} {/testbench/tb_nnn_out(2) -radix binary} {/testbench/tb_nnn_out(1) -radix binary} {/testbench/tb_nnn_out(0) -radix binary}} -subitemconfig {/testbench/tb_nnn_out(11) {-radix binary} /testbench/tb_nnn_out(10) {-radix binary} /testbench/tb_nnn_out(9) {-radix binary} /testbench/tb_nnn_out(8) {-radix binary} /testbench/tb_nnn_out(7) {-radix binary} /testbench/tb_nnn_out(6) {-radix binary} /testbench/tb_nnn_out(5) {-radix binary} /testbench/tb_nnn_out(4) {-radix binary} /testbench/tb_nnn_out(3) {-radix binary} /testbench/tb_nnn_out(2) {-radix binary} /testbench/tb_nnn_out(1) {-radix binary} /testbench/tb_nnn_out(0) {-radix binary}} /testbench/tb_nnn_out
add wave -noupdate -radix binary -childformat {{/testbench/tb_kk_out(7) -radix binary} {/testbench/tb_kk_out(6) -radix binary} {/testbench/tb_kk_out(5) -radix binary} {/testbench/tb_kk_out(4) -radix binary} {/testbench/tb_kk_out(3) -radix binary} {/testbench/tb_kk_out(2) -radix binary} {/testbench/tb_kk_out(1) -radix binary} {/testbench/tb_kk_out(0) -radix binary}} -subitemconfig {/testbench/tb_kk_out(7) {-radix binary} /testbench/tb_kk_out(6) {-radix binary} /testbench/tb_kk_out(5) {-radix binary} /testbench/tb_kk_out(4) {-radix binary} /testbench/tb_kk_out(3) {-radix binary} /testbench/tb_kk_out(2) {-radix binary} /testbench/tb_kk_out(1) {-radix binary} /testbench/tb_kk_out(0) {-radix binary}} /testbench/tb_kk_out
add wave -noupdate -radix binary -childformat {{/testbench/tb_x_out(3) -radix binary} {/testbench/tb_x_out(2) -radix binary} {/testbench/tb_x_out(1) -radix binary} {/testbench/tb_x_out(0) -radix binary}} -subitemconfig {/testbench/tb_x_out(3) {-radix binary} /testbench/tb_x_out(2) {-radix binary} /testbench/tb_x_out(1) {-radix binary} /testbench/tb_x_out(0) {-radix binary}} /testbench/tb_x_out
add wave -noupdate -radix binary -childformat {{/testbench/tb_y_out(3) -radix binary} {/testbench/tb_y_out(2) -radix binary} {/testbench/tb_y_out(1) -radix binary} {/testbench/tb_y_out(0) -radix binary}} -subitemconfig {/testbench/tb_y_out(3) {-radix binary} /testbench/tb_y_out(2) {-radix binary} /testbench/tb_y_out(1) {-radix binary} /testbench/tb_y_out(0) {-radix binary}} /testbench/tb_y_out
add wave -noupdate -radix binary -childformat {{/testbench/tb_n_out(3) -radix binary} {/testbench/tb_n_out(2) -radix binary} {/testbench/tb_n_out(1) -radix binary} {/testbench/tb_n_out(0) -radix binary}} -subitemconfig {/testbench/tb_n_out(3) {-radix binary} /testbench/tb_n_out(2) {-radix binary} /testbench/tb_n_out(1) {-radix binary} /testbench/tb_n_out(0) {-radix binary}} /testbench/tb_n_out
add wave -noupdate -radix binary -childformat {{/testbench/tb_instruction_out(34) -radix binary} {/testbench/tb_instruction_out(33) -radix binary} {/testbench/tb_instruction_out(32) -radix binary} {/testbench/tb_instruction_out(31) -radix binary} {/testbench/tb_instruction_out(30) -radix binary} {/testbench/tb_instruction_out(29) -radix binary} {/testbench/tb_instruction_out(28) -radix binary} {/testbench/tb_instruction_out(27) -radix binary} {/testbench/tb_instruction_out(26) -radix binary} {/testbench/tb_instruction_out(25) -radix binary} {/testbench/tb_instruction_out(24) -radix binary} {/testbench/tb_instruction_out(23) -radix binary} {/testbench/tb_instruction_out(22) -radix binary} {/testbench/tb_instruction_out(21) -radix binary} {/testbench/tb_instruction_out(20) -radix binary} {/testbench/tb_instruction_out(19) -radix binary} {/testbench/tb_instruction_out(18) -radix binary} {/testbench/tb_instruction_out(17) -radix binary} {/testbench/tb_instruction_out(16) -radix binary} {/testbench/tb_instruction_out(15) -radix binary} {/testbench/tb_instruction_out(14) -radix binary} {/testbench/tb_instruction_out(13) -radix binary} {/testbench/tb_instruction_out(12) -radix binary} {/testbench/tb_instruction_out(11) -radix binary} {/testbench/tb_instruction_out(10) -radix binary} {/testbench/tb_instruction_out(9) -radix binary} {/testbench/tb_instruction_out(8) -radix binary} {/testbench/tb_instruction_out(7) -radix binary} {/testbench/tb_instruction_out(6) -radix binary} {/testbench/tb_instruction_out(5) -radix binary} {/testbench/tb_instruction_out(4) -radix binary} {/testbench/tb_instruction_out(3) -radix binary} {/testbench/tb_instruction_out(2) -radix binary} {/testbench/tb_instruction_out(1) -radix binary} {/testbench/tb_instruction_out(0) -radix binary}} -subitemconfig {/testbench/tb_instruction_out(34) {-radix binary} /testbench/tb_instruction_out(33) {-radix binary} /testbench/tb_instruction_out(32) {-radix binary} /testbench/tb_instruction_out(31) {-radix binary} /testbench/tb_instruction_out(30) {-radix binary} /testbench/tb_instruction_out(29) {-radix binary} /testbench/tb_instruction_out(28) {-radix binary} /testbench/tb_instruction_out(27) {-radix binary} /testbench/tb_instruction_out(26) {-radix binary} /testbench/tb_instruction_out(25) {-radix binary} /testbench/tb_instruction_out(24) {-radix binary} /testbench/tb_instruction_out(23) {-radix binary} /testbench/tb_instruction_out(22) {-radix binary} /testbench/tb_instruction_out(21) {-radix binary} /testbench/tb_instruction_out(20) {-radix binary} /testbench/tb_instruction_out(19) {-radix binary} /testbench/tb_instruction_out(18) {-radix binary} /testbench/tb_instruction_out(17) {-radix binary} /testbench/tb_instruction_out(16) {-radix binary} /testbench/tb_instruction_out(15) {-radix binary} /testbench/tb_instruction_out(14) {-radix binary} /testbench/tb_instruction_out(13) {-radix binary} /testbench/tb_instruction_out(12) {-radix binary} /testbench/tb_instruction_out(11) {-radix binary} /testbench/tb_instruction_out(10) {-radix binary} /testbench/tb_instruction_out(9) {-radix binary} /testbench/tb_instruction_out(8) {-radix binary} /testbench/tb_instruction_out(7) {-radix binary} /testbench/tb_instruction_out(6) {-radix binary} /testbench/tb_instruction_out(5) {-radix binary} /testbench/tb_instruction_out(4) {-radix binary} /testbench/tb_instruction_out(3) {-radix binary} /testbench/tb_instruction_out(2) {-radix binary} /testbench/tb_instruction_out(1) {-radix binary} /testbench/tb_instruction_out(0) {-radix binary}} /testbench/tb_instruction_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {254 ns} 0}
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
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
