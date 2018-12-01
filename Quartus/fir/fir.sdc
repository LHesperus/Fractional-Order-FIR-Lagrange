## Generated SDC file "fir.sdc"

## Copyright (C) 1991-2011 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 11.0 Build 208 07/03/2011 Service Pack 1 SJ Full Version"

## DATE    "Tue Nov 27 12:38:22 2018"

##
## DEVICE  "EP4CE6E22C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_manage:clk_manage_inst|clk_fir_lagrange} -period 1.000 -waveform { 0.000 0.500 } [get_registers {clk_manage:clk_manage_inst|clk_fir_lagrange}]
create_clock -name {clk} -period 10.000 -waveform { 0.000 5.000 } [get_ports {clk}]
create_clock -name {clk_manage:clk_manage_inst|clk_testsignal} -period 1.000 -waveform { 0.000 0.500 } [get_registers {clk_manage:clk_manage_inst|clk_testsignal}]
create_clock -name {clk_manage:clk_manage_inst|clk_int_delay} -period 1.000 -waveform { 0.000 0.500 } [get_registers {clk_manage:clk_manage_inst|clk_int_delay}]
create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}] -rise_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}] -fall_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}] -rise_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}] -fall_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -rise_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -fall_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -rise_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -fall_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_int_delay}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_testsignal}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}] -rise_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}] -fall_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}] -rise_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}] -fall_to [get_clocks {clk}]  0.030 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}] -rise_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}] -fall_to [get_clocks {clk_manage:clk_manage_inst|clk_fir_lagrange}]  0.020 


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

