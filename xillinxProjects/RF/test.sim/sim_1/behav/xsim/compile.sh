#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.2 (64-bit)
#
# Filename    : compile.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for compiling the simulation design source files
#
<<<<<<< Updated upstream
<<<<<<< Updated upstream
# Generated by Vivado on Thu Mar 16 11:15:52 CET 2023
=======
# Generated by Vivado on Thu Mar 30 12:08:41 CEST 2023
>>>>>>> Stashed changes
=======
# Generated by Vivado on Thu Apr 27 10:42:47 CEST 2023
>>>>>>> Stashed changes
# SW Build 2258646 on Thu Jun 14 20:02:38 MDT 2018
#
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
#
# usage: compile.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
<<<<<<< Updated upstream
echo "xvhdl --incr --relax -prj ProgramCounter_tb_vhdl.prj"
ExecStep xvhdl --incr --relax -prj ProgramCounter_tb_vhdl.prj 2>&1 | tee -a compile.log
=======
echo "xvhdl --incr --relax -prj Ram256X16_tb_vhdl.prj"
ExecStep xvhdl --incr --relax -prj Ram256X16_tb_vhdl.prj 2>&1 | tee -a compile.log
>>>>>>> Stashed changes
