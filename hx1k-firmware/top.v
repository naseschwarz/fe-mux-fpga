`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// CAPACTIVE TOUCH BUTTON demo for iCEblink40 board, LP1K version
//
// Version 1.1
// Date:  1-MAR-2012
// ===============================================================================
// Description:
//
// When board powers on, the green LEDs along the right edge scroll upward.
// If any button is pressed, the LEDs instead display the current toggle state of
// the buttons.  If no button is pressed in five seconds, then the LEDs return to
// displaying the upward-scrolling pattern.
//////////////////////////////////////////////////////////////////////////////////

module top(
	input in_diff_1_n,
	input in_diff_1_p,
	input in_diff_2_n,
	input in_diff_2_p,
	input in_diff_3_n,
	input in_diff_3_p,
	input in_diff_4_n,
	input in_diff_4_p,
	input in_diff_5_n,
	input in_diff_5_p,
	input in_diff_6_n,
	input in_diff_6_p,
	output out_diff_1_n,
	output out_diff_1_p,
	output out_diff_2_n,
	output out_diff_2_p,
	output out_diff_3_n,
	output out_diff_3_p,
	output out_diff_4_n,
	output out_diff_4_p,
	output out_diff_5_n,
	output out_diff_5_p,
	output out_diff_6_n,
	output out_diff_6_p,
	output out_diff_7_n,
	output out_diff_7_p
);

	wire clk;
	wire [6:1] in_diff_0;
	wire [6:1] in_diff_180;
	wire [7:1] out_diff_0;
	wire [7:1] out_diff_180;

	
	SB_GB_IO #(
		.PIN_TYPE(6'b000000),
		.IO_STANDARD("SB_LVDS_INPUT")
	) sb_in_diff_4 (
		.PACKAGE_PIN(in_diff_4_p),
		.GLOBAL_BUFFER_OUTPUT(clk)
	);
	
	SB_IO #(
		.PIN_TYPE(6'b000000),
		.IO_STANDARD("SB_LVDS_INPUT")
	) sb_in_diff_1 (
		.PACKAGE_PIN(in_diff_1_p),
		.INPUT_CLK(clk),
		.D_IN_0(in_diff_0[1]),
		.D_IN_1(in_diff_180[1])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b000000),
		.IO_STANDARD("SB_LVDS_INPUT")
	) sb_in_diff_2 (
		.PACKAGE_PIN(in_diff_2_p),
		.INPUT_CLK(clk),
		.D_IN_0(in_diff_0[2]),
		.D_IN_1(in_diff_180[2])
	);

	SB_IO #(
		.PIN_TYPE(6'b000000),
		.IO_STANDARD("SB_LVDS_INPUT")
	) sb_in_diff_3 (
		.PACKAGE_PIN(in_diff_3_p),
		.INPUT_CLK(clk),
		.D_IN_0(in_diff_0[3]),
		.D_IN_1(in_diff_180[3])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b000000),
		.IO_STANDARD("SB_LVDS_INPUT")
	) sb_in_diff_5 (
		.PACKAGE_PIN(in_diff_5_p),
		.INPUT_CLK(clk),
		.D_IN_0(in_diff_0[5]),
		.D_IN_1(in_diff_180[5])
	);

	SB_IO #(
		.PIN_TYPE(6'b000000),
		.IO_STANDARD("SB_LVDS_INPUT")
	) sb_in_diff_6 (
		.PACKAGE_PIN(in_diff_6_p),
		.INPUT_CLK(clk),
		.D_IN_0(in_diff_0[6]),
		.D_IN_1(in_diff_180[6])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_1_p  (
		.PACKAGE_PIN(out_diff_1_p),
		.OUTPUT_CLK(clk),
		.D_OUT_0(out_diff_0[1]),
		.D_OUT_1(out_diff_180[1])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_1_n (
		.PACKAGE_PIN(out_diff_1_n),
		.OUTPUT_CLK(clk),
		.D_OUT_0(~out_diff_0[1]),
		.D_OUT_1(~out_diff_180[1])
	);


	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_2_p  (
		.PACKAGE_PIN(out_diff_2_p),
		.OUTPUT_CLK(clk),
		.D_OUT_0(out_diff_0[2]),
		.D_OUT_1(out_diff_180[2])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_2_n (
		.PACKAGE_PIN(out_diff_2_n),
		.OUTPUT_CLK(clk),
		.D_OUT_0(~out_diff_0[2]),
		.D_OUT_1(~out_diff_180[2])
	);


	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_3_p  (
		.PACKAGE_PIN(out_diff_3_p),
		.OUTPUT_CLK(clk),
		.D_OUT_0(out_diff_0[3]),
		.D_OUT_1(out_diff_180[3])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_3_n (
		.PACKAGE_PIN(out_diff_3_n),
		.OUTPUT_CLK(clk),
		.D_OUT_0(~out_diff_0[3]),
		.D_OUT_1(~out_diff_180[3])
	);

	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_4_p  (
		.PACKAGE_PIN(out_diff_4_p),
		.OUTPUT_CLK(clk),
		.D_OUT_0(out_diff_0[4]),
		.D_OUT_1(out_diff_180[4])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_4_n (
		.PACKAGE_PIN(out_diff_4_n),
		.OUTPUT_CLK(clk),
		.D_OUT_0(~out_diff_0[4]),
		.D_OUT_1(~out_diff_180[4])
	);

	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_5_p  (
		.PACKAGE_PIN(out_diff_5_p),
		.OUTPUT_CLK(clk),
		.D_OUT_0(out_diff_0[5]),
		.D_OUT_1(out_diff_180[5])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_5_n (
		.PACKAGE_PIN(out_diff_5_n),
		.OUTPUT_CLK(clk),
		.D_OUT_0(~out_diff_0[5]),
		.D_OUT_1(~out_diff_180[5])
	);

	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_6_p  (
		.PACKAGE_PIN(out_diff_6_p),
		.OUTPUT_CLK(clk),
		.D_OUT_0(out_diff_0[6]),
		.D_OUT_1(out_diff_180[6])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_6_n (
		.PACKAGE_PIN(out_diff_6_n),
		.OUTPUT_CLK(clk),
		.D_OUT_0(~out_diff_0[6]),
		.D_OUT_1(~out_diff_180[6])
	);


	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_7_p  (
		.PACKAGE_PIN(out_diff_7_p),
		.OUTPUT_CLK(clk),
		.D_OUT_0(out_diff_0[7]),
		.D_OUT_1(out_diff_180[7])
	);
	
	SB_IO #(
		.PIN_TYPE(6'b010000),
		.IO_STANDARD("SB_LVCMOS")
	) sb_out_diff_7_n (
		.PACKAGE_PIN(out_diff_7_n),
		.OUTPUT_CLK(clk),
		.D_OUT_0(~out_diff_0[7]),
		.D_OUT_1(~out_diff_180[7])
	);

	top_int top_int (
		.clk(clk),
		.in_diff_0(in_diff_0),
		.in_diff_180(in_diff_180),
		.out_diff_0(out_diff_0),
		.out_diff_180(out_diff_180)
	);
endmodule

module top_int (
	input wire clk,
	input wire [6:1] in_diff_0,
	input wire [6:1] in_diff_180,
	output reg [7:1] out_diff_0,
	output reg [7:1] out_diff_180
);
	


	always @(posedge clk)
	begin
		out_diff_0[3] <= 0;
		out_diff_180[3] <= 1;
		out_diff_0[5] <= 0;
		out_diff_180[5] <= 1;
	end

	always @(posedge clk)
	begin
		out_diff_0[2] <= in_diff_180[3];
		out_diff_0[4] <= in_diff_180[3];
	end

	always @(negedge clk)
	begin
		out_diff_180[2] <= in_diff_180[3];
		out_diff_180[4] <= in_diff_180[3];
		out_diff_0[7] <= in_diff_0[5];
		out_diff_180[7] <= in_diff_180[6];
	end

endmodule
