`timescale 1ns/1ps
module segment_scan8(input wire clk,rst,enable,input wire [31:0] digits,output reg [7:0] select,segments,output reg [2:0] index);
reg blank;reg [3:0] nibble;
always @(posedge clk) if(rst) begin index<=0;blank<=1;end else if(enable) begin blank<=~blank;if(!blank) index<=index+1'b1;end
always @* begin nibble=digits>>(index*4);select=blank ? 8'h00 : (8'h01<<index);
case(nibble)
0:segments=8'hfc;1:segments=8'h60;2:segments=8'hda;3:segments=8'hf2;
4:segments=8'h66;5:segments=8'hb6;6:segments=8'hbe;7:segments=8'he0;
8:segments=8'hfe;9:segments=8'hf6;10:segments=8'hee;11:segments=8'h3e;
12:segments=8'h9c;13:segments=8'h7a;14:segments=8'h9e;15:segments=8'h8e;
default:segments=0;endcase end
endmodule