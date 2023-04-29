`timescale 1ns / 1ps

module IM
#(
    parameter INS_ADDRESS = 9,
    parameter INS_W = 32
     )(
    input logic [ INS_ADDRESS -1:0] ra , 
    output logic [ INS_W -1:0] rd 
    );
    

logic [INS_W-1 :0] Inst_mem [(2**(INS_ADDRESS-2))-1:0];
    
//R-type    
assign Inst_mem[0]   = 32'h00100093;//      addi r1,r0, 1         
assign Inst_mem[1]   = 32'h404404b3;//      sub  r9,r8,r4           
assign Inst_mem[2]  = 32'h00317533;//      and r10 = r2 & r3       
assign Inst_mem[3]  = 32'h0072c7b3;//     xor r15, r5, r7          
assign Inst_mem[4]   = 32'h00007033;//      and  r0,r0,r0                     
assign Inst_mem[5]  = 32'h0041e5b3;//      or  r11 = r3 | r4       
assign Inst_mem[6]  = 32'h00a8a833;//     slt   r16, r17,r10          
assign Inst_mem[7]  = 32'h00311733;//     sll r14, r2, r3          
assign Inst_mem[8]  = 32'h00235833;//     srl r16, r6, r2          
assign Inst_mem[9]  = 32'h4034d8b3;//     sra r17, r9, r3          
assign Inst_mem[10]  = 32'h00a8b833;//     sltu  r16, r9,r10        


 //I type+
 
assign Inst_mem[11]   =  32'h00208433;//      add  r8,r1,r2            
assign Inst_mem[12]  = 32'h06f37613;//     andi r12, r6, 6fh       
assign Inst_mem[13]  = 32'h02e2e593;//     ori  r11, r5, 2eh       
assign Inst_mem[14]  = 32'h0028a813;//     slti  r16, r9, 2        
assign Inst_mem[15]  = 32'h0028b813;//     sltiu  r16, r9, 2       
assign Inst_mem[16]  = 32'h01614513;//     xori r10, r2, 16h       
assign Inst_mem[17]  = 32'h00349693;//     slli r13, r9, 3h        
assign Inst_mem[18]  = 32'h00335713;//     srli r14, r6, 3h        
assign Inst_mem[19]  = 32'h4026d793;//     srai r15, r13, 2h       
assign Inst_mem[20]  = 32'h03002603;//      lw r12 <- 48(r0)       
assign Inst_mem[21]  = 32'h000586e7;//     jalr x13, 0(x11)         

//S type
assign Inst_mem[22]  = 32'h02a02823;//      sw  48(r0)<- r10       

//B type
assign Inst_mem[23]  = 32'h02b20263;//      beq r4,r11,36            
assign Inst_mem[24]  = 32'h00419a63;//      bne r3,r4,20            
assign Inst_mem[25]  = 32'h0014c263;//      blt r9,r1,4             

//U type

assign Inst_mem[26]  = 32'hccccc837;//     

//U-J type
assign Inst_mem[27]  = 32'h018005ef;//       
assign Inst_mem[28]  = 32'h00005097;

assign Inst_mem[29]  = 32'h30F263;//bgeu
assign Inst_mem[30]  = 32'h304263;//bltu
assign Inst_mem[31]  = 32'h305263;//bge

assign Inst_mem[32]  = 32'h35B99073;//CSRRN
assign Inst_mem[33]  = 32'h53462073;//CSRRS
assign Inst_mem[34]  = 32'h3F983073;//CSRRC
assign Inst_mem[35]  = 32'h1F1D073;//CSRRW1
assign Inst_mem[36]  = 32'hF556073;//CSRRS1
assign Inst_mem[37]  = 32'hEB1E7073;//CSRRC1




assign rd =  Inst_mem [ra[INS_ADDRESS-1:2]];  



endmodule
