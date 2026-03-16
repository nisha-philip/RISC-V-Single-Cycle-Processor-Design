module top(clk,reset);
input clk,reset;
wire [31:0] PC_top,instruction_top, Rd1_top, Rd2_top, ImmExt_top,ALUMuxOp,nextPC,PCMuxOp,Addersum,ALU_Result,MemDataout,Write_data;
wire RegWrite_top, ALUSrc_top, PCMuxsel,Branch,zero,MemtoReg,MemWrite,MemRead;
wire [1:0] ALUOp_top;
wire [3:0] ALUControl;

//program counter
Program_Counter PC(.clk(clk),.reset(reset),.PC_in(PCMuxOp),.PC_out(PC_top));

//PC Adder to point to next instruction
PCplus4 PCadd(.PC_out(PC_top),.nextPC(nextPC));

//instruction memory
Instr_Mem Imem(.clk(clk),.reset(reset),.read_address(PC_top), .instruction_out(instruction_top));

//register file
Reg_file Registers(.clk(clk),.reset(reset),.RegWrite(RegWrite_top), .Rs1(instruction_top[19:15]), .Rs2(instruction_top[24:20]),.Rd(instruction_top[11:7]), .Write_data(Write_data),.read_data1(Rd1_top),.read_data2(Rd2_top));

//immediate generator for sign extend
ImmGen SignExt(.Opcode(instruction_top[6:0]),.instruction(instruction_top), .ImmExt(ImmExt_top));

//control unit
Control_unit Cunit(.instruction(instruction_top[6:0]), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .ALUOp(ALUOp_top),.MemWrite(MemWrite), .ALUSrc(ALUSrc_top), .RegWrite(RegWrite_top));

//ALU Control
ALU_Control ALUCont(.ALUOp(ALUOp_top), .fun7(instruction_top[30]), .fun3(instruction_top[14:12]), .Control_out(ALUControl));

//ALU Unit
ALU_unit ALU(.A(Rd1_top),.B(ALUMuxOp),.Control_in(ALUControl),.ALU_Result(ALU_Result), .zero(zero));

//ALU MUX
Mux MuxALU(.sel(ALUSrc_top), .A(Rd2_top),.B(ImmExt_top), .op(ALUMuxOp));

//adder
Adder Adds(.i1(PC_top),.i2(ImmExt_top),.sum(Addersum));
//and gate
and A1(PCMuxsel,Branch,zero);

//PC Mux
Mux MuxPC(.sel(PCMuxsel), .A(nextPC),.B(Addersum), .op(PCMuxOp));

//data memory
Data_Memory datamem(.clk(clk), .reset(reset), .MemWrite(MemWrite), .MemRead(MemRead), .read_address(ALU_Result), .Write_data(Rd2_top), .MemData_out(MemDataout));

//datamux
Mux datamux(.sel(MemtoReg), .A(ALU_Result),.B(MemDataout), .op(Write_data));



endmodule
