`timescale 1ns/100ps
module parameterized_alu_tb;

parameter WIDTH = 8;
reg [WIDTH-1:0] A;
reg [WIDTH-1:0] B;
reg [2:0] opcode;
wire [WIDTH-1:0] result;
wire carry;
wire zero;
wire overflow;
wire negative;

parameterized_alu #(WIDTH)DUT(.A(A), .B(B), .opcode(opcode), .result(result), .carry(carry), .zero(zero), .overflow(overflow), .negative(negative));

initial
begin

$dumpfile("waveform.vcd");
$dumpvars(0,parameterized_alu_tb);
$monitor("time=%d\tA=%d\tB=%d\topcode=%b\tresult=%d\tcarry=%b\tzero=%b\toverflow=%b\tnegative=%b", $time, A, B, opcode, result, carry, zero, overflow, negative);

A = 8'b10000000;
B = 8'b00000001;

opcode = 3'b000;
#10;

opcode = 3'b001;
#10;

opcode = 3'b010;
#10;

opcode = 3'b011;
#10;

opcode = 3'b100;
#10;

opcode = 3'b101;
#10;

opcode = 3'b110;
#10;

opcode = 3'b111;
#10;

$finish;

end

endmodule