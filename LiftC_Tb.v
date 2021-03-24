`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2021 21:56:31
// Design Name: 
// Module Name: LiftC_Tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LiftC_Tb();
reg clk,reset;
reg [6:0] req_floor;
wire [1:0] stop,door,Up,Down; 
wire [6:0] y;

LiftC dut(clk,reset,req_floor,stop,door,Up,Down,y);

initial begin
clk=0;
forever #5 clk =~ clk;
end
initial begin 
reset = 1;
#10;
reset=0;
req_floor=6'd25;
#600
req_floor=6'd3;
#400
req_floor=6'd37;
#600
req_floor=6'd10;
end
endmodule
