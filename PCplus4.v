//PC plus 4
module PCplus4(PC_out,nextPC);

input [31:0] PC_out;
output [31:0] nextPC;
assign nextPC= PC_out+4;

endmodule
