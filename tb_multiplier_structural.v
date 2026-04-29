module tb_multiplier_improved;

reg [3:0] A, B;
wire [7:0] P;

multiplier_4bit_improved uut (
    .A(A),
    .B(B),
    .P(P)
);

initial begin
    $display("---- 4-bit Multiplier Test ----");
    $monitor("Time=%0t | A=%d B=%d | P=%d", $time, A, B, P);

    // Test cases
    test(3,2);
    test(7,3);
    test(15,15);
    test(0,9);
    test(1,15);
    test(8,2);
    test(9,9);

    $finish;
end

// Task for cleaner testing
task test(input [3:0] a, input [3:0] b);
begin
    A = a; B = b; #10;
    if (P !== A * B)
        $display("❌ ERROR: A=%d B=%d Expected=%d Got=%d", A, B, A*B, P);
    else
        $display("✅ PASS");
end
endtask

endmodule