module FullAdder (
  input A, // Bit de entrada A
  input B, // Bit de entrada B
  input Cin, // Carry de entrada
  output Sum, // Soma
  output Cout // Carry de saída
);

assign {Cout, Sum} = A + B + Cin;

endmodule

module FullAdder8bit (
  input [7:0] A, // Entrada A (8 bits)
  input [7:0] B, // Entrada B (8 bits)
  input Cin, // Carry de entrada
  output [7:0] Sum, // Soma (8 bits)
  output Cout // Carry de saída
);

wire [7:0] CarryChain;

genvar i;
generate
  for (i = 0; i < 8; i = i + 1) begin : adder_loop
    FullAdder FA (
      .A(A[i]),
      .B(B[i]),
      .Cin(i ? CarryChain[i-1] : Cin),
      .Sum(Sum[i]),
      .Cout(CarryChain[i])
    );
  end
endgenerate

assign Cout = CarryChain[7];

endmodule