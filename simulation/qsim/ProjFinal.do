onerror {quit -f}
vlib work
vlog -work work ProjFinal.vo
vlog -work work ProjFinal.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Display_vlg_vec_tst
vcd file -direction ProjFinal.msim.vcd
vcd add -internal Display_vlg_vec_tst/*
vcd add -internal Display_vlg_vec_tst/i1/*
add wave /*
run -all
