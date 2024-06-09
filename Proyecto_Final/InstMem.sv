module InstMem (
    input logic [31:0] Read_Address,
    output logic [31:0] Instruction
);

    logic [31:0] Memory [0:63]; 

    initial begin
        $readmemh("changeVowels.hex", Memory);
    end

    always @* begin
        Instruction = Memory[Read_Address[9:2]];
    end

endmodule