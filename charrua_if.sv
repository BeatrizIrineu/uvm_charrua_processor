interface charrua_if; 
	logic clk;
	logic reset_n;
	logic hold_n;
	logic [15:0] im_data;
	logic [9:0] im_addr;
	logic im_CEn;
	logic im_OEn;
	logic dm_CEn;
	logic dm_OEn;
	logic dm_WEn; 
	logic [15:0] dm_in_data;
	logic [15:0] dm_out_data;
endinterface : charrua_if