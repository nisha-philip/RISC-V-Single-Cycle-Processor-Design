module ALU_Control(ALUOp, fun7, fun3, Control_out);

input fun7;
input [2:0] fun3;
input [1:0] ALUOp;
output reg [3:0] Control_out;

always @(*)
begin
    case(ALUOp)
        2'b00: Control_out = 4'b0010; // Load/Store (Add)
        2'b01: Control_out = 4'b0110; // Branch (Sub)
        2'b10: begin // R-type logic
            case(fun3)
                3'b000: Control_out = (fun7) ? 4'b0110 : 4'b0010; // Sub vs Add
                3'b111: Control_out = 4'b0000; // AND
                3'b110: Control_out = 4'b0001; // OR
                default: Control_out = 4'b0010; // Default to Add
            endcase
        end
        default: Control_out = 4'b0010;
    endcase
end
endmodule
