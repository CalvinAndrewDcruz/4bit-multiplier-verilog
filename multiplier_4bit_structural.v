// =======================================================
// 4-bit Array Multiplier (Clean Structural/Dataflow Hybrid)
// - Partial products using AND
// - Summation using structured addition
// - Interview-ready readable RTL
// =======================================================

module multiplier_4bit_improved (
    input  [3:0] A,   // Multiplicand
    input  [3:0] B,   // Multiplier
    output [7:0] P    // Product
);

// -------------------------------
// Partial Products
// -------------------------------
wire [3:0] pp0, pp1, pp2, pp3;

assign pp0 = A & {4{B[0]}};
assign pp1 = A & {4{B[1]}};
assign pp2 = A & {4{B[2]}};
assign pp3 = A & {4{B[3]}};

// -------------------------------
// Shifted Partial Products
// -------------------------------
wire [7:0] row0, row1, row2, row3;

assign row0 = {4'b0000, pp0};          // no shift
assign row1 = {3'b000,  pp1, 1'b0};    // shift 1
assign row2 = {2'b00,   pp2, 2'b00};   // shift 2
assign row3 = {1'b0,    pp3, 3'b000};  // shift 3

// -------------------------------
// Addition Stages
// -------------------------------
wire [7:0] sum_stage1;
wire [7:0] sum_stage2;

assign sum_stage1 = row0 + row1;
assign sum_stage2 = sum_stage1 + row2;
assign P          = sum_stage2 + row3;

endmodule