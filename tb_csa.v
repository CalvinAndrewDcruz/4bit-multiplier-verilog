module tb_multiplier_csa;

reg [3:0] A, B;
wire [7:0] P;

multiplier_4bit_csa uut (
    .A(A),
    .B(B),
    .P(P)
);

initial begin
    test(3,2);
    test(7,3);
    test(15,15);
    test(9,9);
    test(8,2);
    $finish;
end

task test(input [3:0] a, input [3:0] b);
begin
    A = a; B = b; #10;
    if (P !== A * B)
        $display("❌ ERROR: A=%d B=%d Expected=%d Got=%d", A, B, A*B, P);
    else
        $display("✅ PASS: %d × %d = %d", A, B, P);
end
endtask

endmodule