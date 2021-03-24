`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2021 13:58:28
// Design Name: 
// Module Name: LiftC
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


module LiftC(clk,reset,req_floor,stop,door,Up,Down,y);

input clk,reset;

input [6:0] req_floor;
output reg[1:0] door;
output reg[1:0] Up;
output reg[1:0] Down;
output reg[1:0] stop;

output [6:0] y;
reg [6:0] cf ;

always @ (posedge clk)
begin

if(reset)
begin
cf=6'd0;
stop=6'd1;
door = 1'd1;
Up=1'd0;
Down=1'd0;
end
else
begin
if(req_floor < 6'd61)
begin

if(req_floor < cf )
begin
cf=cf-1;
door=1'd0;
stop=6'd0;
Up=1'd0;
Down=1'd1;
end


else if (req_floor > cf)
begin
cf = cf+1;
door=1'd0;
stop=6'd0;
Up=1'd1;
Down=1'd0;
end

else if(req_floor == cf )
begin
cf = req_floor;
door=1'd1;
stop=6'd1;
Up=1'd0;
Down=1'd0;
end
end


end


end


assign y = cf;

endmodule
