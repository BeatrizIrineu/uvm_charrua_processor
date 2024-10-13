package charrua_pkg;
	import uvm_pkg::*;

	`include "uvm_macros.svh"

	typedef uvm_config_db#(virtual charrua_if) charrua_vif_config;
	typedef virtual charrua_if charrua_vif;

	`include "charrua_transfer.sv"
	
	`include "charrua_scoreboard.sv"

	`include "charrua_instm_monitor.sv"
	`include "charrua_instm_sequencer.sv"
	`include "charrua_instm_driver.sv"
	`include "charrua_instm_agent.sv"
	
	`include "charrua_bus_monitor.sv"
	`include "charrua_env.sv"


endpackage: charrua_pkg