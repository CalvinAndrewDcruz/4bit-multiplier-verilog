module tb_multiplier;

reg [3:0] A, B;
wire [7:0] P;

multiplier_4bit uut (
    .A(A),
    .B(B),
    .P(P)
);

initial begin
    $monitor("A=%d B=%d P=%d", A, B, P);

    A=4'd3; B=4'd2; #10;
    A=4'd7; B=4'd3; #10;
    A=4'd15; B=4'd15; #10;
    A=4'd0; B=4'd9; #10;

    $finish;
end

endmodule
