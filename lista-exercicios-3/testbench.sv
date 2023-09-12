module FullAdder8bitTestbench;

reg [7:0] A;
reg [7:0] B;
reg Cin;
wire [7:0] Sum;
wire Cout;

FullAdder8bit uut (
  .A(A),
  .B(B),
  .Cin(Cin),
  .Sum(Sum),
  .Cout(Cout)
);

// Registrar as formas de onda para análise
initial begin

  $dumpfile("waveform.vcd"); 
  $dumpvars(0, FullAdder8bitTestbench); 

  A = 8'b11011011;
  B = 8'b10101010;
  Cin = 1;
  #10;
  if (Sum === 8'b110101000 && Cout === 1)
    $display("Teste 1 passou");
  else
    $display("Teste 1 falhou");

  A = 8'b01100011;
  B = 8'b10010101;
  Cin = 0;
  #10;
  if (Sum === 8'b11111000 && Cout === 0)
    $display("Teste 2 passou");
  else
    $display("Teste 2 falhou");

  $finish;
end

endmodule