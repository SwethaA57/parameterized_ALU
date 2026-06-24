module parameterized_alu #(parameter WIDTH = 8)
(
input [WIDTH-1:0] A,
input [WIDTH-1:0] B,
input [2:0] opcode,
output reg [WIDTH-1:0] result,
output reg carry,
output reg zero,
output reg  overflow,
output reg negative
);

always @(*)
begin
    carry=0;
    overflow=0;

case(opcode)

3'b000: 
begin
   {carry,result} = A + B;
   overflow =(~A[WIDTH-1] & ~B[WIDTH-1] & result[WIDTH-1]) | ( A[WIDTH-1] &  B[WIDTH-1] & ~result[WIDTH-1]); 
end


3'b001:
begin
  result = A - B;
  overflow =(~A[WIDTH-1] & B[WIDTH-1] & result[WIDTH-1]) |(A[WIDTH-1] & ~B[WIDTH-1] & ~result[WIDTH-1]);
end

3'b010:
result = A & B;

3'b011:
result = A | B;

3'b100:
result = A ^ B;

3'b101:
result = A << 1;

3'b110:
result = A >> 1;

3'b111:
begin
if(A>B)
result = 1;
else
result = 0;
end

default:
result = 0;

endcase
 
if(result==0)
   zero=1;
else 
   zero=0;

if(result[WIDTH-1] == 1)
    negative = 1;
else
    negative = 0;

end

endmodule