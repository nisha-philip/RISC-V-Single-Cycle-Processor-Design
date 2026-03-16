module Mux(sel, A,B, op);

input sel;
input [31:0] A,B;
output [31:0] op;

assign op= (sel==1'b0) ? A: B;
endmodule
