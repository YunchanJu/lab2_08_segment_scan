`timescale 1ns/1ps
module lab2_segment_scan(input wire clk,rst,button,input wire [7:0] sw,output wire [7:0] led, output wire [7:0] seg_data,seg_com);
wire reset,press; wire [7:0] switches;
input_frontend inputs(clk,rst,button,sw,reset,press,switches);
wire [7:0] selected; wire [2:0] index; segment_scan8 core(clk,reset,1'b1,{28'h7654321,switches[7:4]},selected,seg_data,index); assign seg_com=~{selected[0],selected[1],selected[2],selected[3],selected[4],selected[5],selected[6],selected[7]}; assign led={5'b0,index};
endmodule
