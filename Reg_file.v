//register files
module Reg_file(clk,reset,RegWrite, Rs1, Rs2,Rd, Write_data,read_data1,read_data2);

input clk,reset,RegWrite;
input [4:0] Rs1,Rs2,Rd;
input [31:0] Write_data;
output [31:0] read_data1,read_data2;
reg [31:0] Registers[31:0];
integer i;
initial begin
    for(i=0; i<32; i=i+1) Registers[i] = 32'b0;
end

// 2. Synchronous Write logic only
always@(posedge clk) begin
    if(RegWrite && Rd != 5'b0) begin // RISC-V: x0 is always 0
        Registers[Rd] <= Write_data;
    end
end

// 3. Asynchronous Read (This part of your code was already correct!)
assign read_data1 = Registers[Rs1];
assign read_data2 = Registers[Rs2];
endmodule
