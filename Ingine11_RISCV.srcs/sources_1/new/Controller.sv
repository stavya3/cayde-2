`timescale 1ns / 1ps

module Controller(
    
    //Input
    input logic [6:0] Opcode, //7-bit opcode field from the instruction
    
    //Outputs
    output logic ALUSrc,
    output logic MemtoReg,RegtoMem, 
    output logic RegWrite, 
    output logic MemRead,  
    output logic MemWrite, 
    output logic Branch,
    output logic [1:0] ALUOp,
    output logic Con_Jalr,Con_Jal,Mem,OpI,Con_AUIPC,Con_LUI

);


    
    logic [6:0] R_TYPE, LW, SW, RTypeI, BR, JALR, JAL,AUIPC,LUI;
    assign  BR     = 7'b1100011;
    assign  R_TYPE = 7'b0110011;
    assign  LW     = 7'b0000011;
    assign  SW     = 7'b0100011;
    assign  RTypeI = 7'b0010011; 
    assign  JAL = 7'b1101111;
    assign  JALR = 7'b1100111;
    assign  AUIPC = 7'b0010111;
    assign  LUI = 7'b0110111;

  assign Con_Jal = (Opcode == JAL);  
  assign Con_Jalr = (Opcode == JALR);  
  assign Branch = (Opcode == BR);  
  assign ALUSrc   = (Opcode==LW || Opcode==SW || Opcode == RTypeI);
  assign MemtoReg = (Opcode==LW);
  assign RegtoMem = (Opcode==SW);
  assign RegWrite = (Opcode==R_TYPE || Opcode==LW || Opcode == RTypeI || Opcode == JALR || Opcode == JAL);
  assign Mem = (Opcode==LW||Opcode==SW);
  assign MemRead  = (Opcode==LW);
  assign MemWrite = (Opcode==SW||Opcode == JALR);
  assign ALUOp[0] = (Opcode==BR);
  assign OpI = (Opcode==RTypeI);
  assign ALUOp[1] = (Opcode==R_TYPE);
  assign Con_AUIPC = (Opcode==AUIPC);
  assign Con_LUI = (Opcode==LUI);
  

endmodule
