# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7k70tfbv676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.cache/wt [current_project]
set_property parent.project_path C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/ADD_SUBB_8bit.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/Adder_Subtractor.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/DD.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/Enabler.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/Full_adder.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/Half_adder.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/MUX2x1.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/MUX2x1x8.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/MUX4x1.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/SubDecoder.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/enabler8bit.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/logic_unit.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/logic_unit8bit.vhd
  C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/RF/test.srcs/sources_1/new/ALU.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/Nexys_4_DDR_Master.xdc
set_property used_in_implementation false [get_files C:/Users/thoma/Documents/DTU/_62711_digital_systems_design/PWA/PWA/xillinxProjects/Nexys_4_DDR_Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top ALU -part xc7k70tfbv676-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef ALU.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file ALU_utilization_synth.rpt -pb ALU_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
