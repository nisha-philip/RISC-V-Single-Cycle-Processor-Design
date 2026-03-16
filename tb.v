module tb;

reg clk,reset;

top uut(.clk(clk), .reset(reset));

initial begin
	clk=0;
	reset=1;
		uut.Registers.Registers[0]=0;
	uut.Registers.Registers[1]=4;
	uut.Registers.Registers[2]=2;
	uut.Registers.Registers[3]=24;
	uut.Registers.Registers[4]=4;
	uut.Registers.Registers[5]=1;
	uut.Registers.Registers[6]=44;
	uut.Registers.Registers[7]=4;
	uut.Registers.Registers[8]=2;
	uut.Registers.Registers[9]=1;
	uut.Registers.Registers[10]=23;
	uut.Registers.Registers[11]=4;
	uut.Registers.Registers[12]=90;
	uut.Registers.Registers[13]=10;
	uut.Registers.Registers[14]=20;
	uut.Registers.Registers[15]=30;
	uut.Registers.Registers[16]=40;
	uut.Registers.Registers[17]=50;
	uut.Registers.Registers[18]=60;
	uut.Registers.Registers[19]=70;
	uut.Registers.Registers[20]=80;
	uut.Registers.Registers[21]=80;
	uut.Registers.Registers[22]=90;
	uut.Registers.Registers[23]=70;
	uut.Registers.Registers[24]=60;
	uut.Registers.Registers[25]=65;
	uut.Registers.Registers[26]=4;
	uut.Registers.Registers[27]=32;
	uut.Registers.Registers[28]=12;
	uut.Registers.Registers[29]=34;
	uut.Registers.Registers[30]=5;
	uut.Registers.Registers[31]=10;

	// R-type
uut.Imem.IMemory[0]  = 32'b00000000000000000000000000000000;    // no operation
uut.Imem.IMemory[1] = 32'b0000000_11001_10000_000_01101_0110011;    // PC 4
uut.Imem.IMemory[2] = 32'b0100000_00011_01000_000_00101_0110011;    // PC 8
uut.Imem.IMemory[3] = 32'b0000000_00011_00010_111_00001_0110011;    // PC 12
uut.Imem.IMemory[4]  = 32'b0000000_11001_10000_000_01101_0110011; // add x13, x16, x25
uut.Imem.IMemory[5] = 32'b000000000011_10101_000_10110_0010011;    // PC 20
uut.Imem.IMemory[6] = 32'b000000000001_01000_110_01001_0010011;    // PC 24
uut.Imem.IMemory[7] = 32'b000000001111_00101_010_01000_0000011;    // PC 28
uut.Imem.IMemory[8]  = 32'b0100000_00011_01000_000_00101_0110011; // sub x5, x8, x3
uut.Imem.IMemory[9] = 32'b0000000_01111_00101_010_01100_0100011;    // PC 36
uut.Imem.IMemory[10] = 32'b0000000_01110_00110_010_01010_0100011;   // PC 40
uut.Imem.IMemory[11] = 32'h00948663;
uut.Imem.IMemory[12] = 32'b0000000_00011_00010_111_00001_0110011; // and x1, x2, x3
uut.Imem.IMemory[16] = 32'b0000000_00101_00011_110_00100_0110011; // or x4, x3, x5

// I-type
uut.Imem.IMemory[20] = 32'b000000000011_10101_000_10110_0010011; // addi x22, x21, 3
uut.Imem.IMemory[24] = 32'b000000000001_01000_110_01001_0010011; // ori x9, x8, 1

// L-type
uut.Imem.IMemory[28] = 32'b000000001111_00101_010_01000_0000011; // lw x8, 15(x5)
uut.Imem.IMemory[32] = 32'b000000000011_00011_010_01001_0000011; // lw x9, 3(x3)

// S-type
uut.Imem.IMemory[36] = 32'b0000000_01111_00101_010_01100_0100011; // sw x15, 12(x5)
uut.Imem.IMemory[40] = 32'b0000000_01110_00110_010_01010_0100011; // sw x14, 10(x6)

// SB-type
uut.Imem.IMemory[44] = 32'h00948663; // beq x9, x9, 12


	#10;
	reset=0;
	#400;
end

always begin
	#5 clk=~clk;
end

endmodule
