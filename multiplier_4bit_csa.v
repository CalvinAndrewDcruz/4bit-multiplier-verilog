`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2026 11:38:42
// Design Name: 
// Module Name: multiplier_4bit_csa
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


// =======================================================
// 4-bit Carry Save Multiplier (High-Speed)
// =======================================================

module multiplier_4bit_csa (
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);

// -------------------------------
// Partial Products
// -------------------------------
wire [3:0] pp0 = A & {4{B[0]}};
wire [3:0] pp1 = A & {4{B[1]}};
wire [3:0] pp2 = A & {4{B[2]}};
wire [3:0] pp3 = A & {4{B[3]}};

// -------------------------------
// Shifted Rows
// -------------------------------
wire [7:0] row0 = {4'b0000, pp0};
wire [7:0] row1 = {3'b000,  pp1, 1'b0};
wire [7:0] row2 = {2'b00,   pp2, 2'b00};
wire [7:0] row3 = {1'b0,    pp3, 3'b000};

// -------------------------------
// CSA Stage (3 → 2 reduction)
// -------------------------------
wire [7:0] sum1, carry1;

assign sum1   = row0 ^ row1 ^ row2;
assign carry1 = (row0 & row1) | (row1 & row2) | (row0 & row2);

// shift carry
wire [7:0] carry1_shifted = carry1 << 1;

// -------------------------------
// Second CSA Stage
// -------------------------------
wire [7:0] sum2, carry2;

assign sum2   = sum1 ^ carry1_shifted ^ row3;
assign carry2 = (sum1 & carry1_shifted) | 
                (carry1_shifted & row3) | 
                (sum1 & row3);

wire [7:0] carry2_shifted = carry2 << 1;

// -------------------------------
// Final Adder (only ONE carry propagation)
// -------------------------------
assign P = sum2 + carry2_shifted;

endmodulemodule multiplier_4bit_csa(

    );
endmodule
