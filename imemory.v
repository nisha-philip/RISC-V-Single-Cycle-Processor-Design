//intstruction memory
module Instr_Mem(clk,reset,read_address, instruction_out);

input clk,reset;
input [31:0] read_address;
output [31:0] instruction_out;
//integer k;
reg [31:0] IMemory[63:0];//memory 32 bit , 64 locations
assign instruction_out=IMemory[read_address[7:2]];
//always@(posedge clk or posedge reset)
//begin
//	if(reset)
//	begin
//		for(k=0;k<64; k=k+1)
//		begin
//			IMemory[k] <=32'b00;
//		end
//	end
//	else 
//	instruction_out<=IMemory[read_address];
//end


endmodule
