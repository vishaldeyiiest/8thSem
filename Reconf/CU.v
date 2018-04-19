
module CU(
output en,
output rwb,
output memaddr,
inout memdata

);

reg [7:0] REGS [11:0];
reg [7:0] PC;
reg [11:0] IR;
reg [7:0] MAR;
reg [11:0] MDR;

reg [3:0] opcode;
wire [3:0] src;
wire [3:0] dest;

reg tmp_en;
reg tmp_rwb;
reg [11:0] tmp_memdata;

assign src = IR[3:0];
assign dest = IR[7:4];
assign memaddr = MAR;

assign en = tmp_en;
assign rwb = tmp_rwb;
assign memdata = (en && rwb) ? tmp_memdata : 0;

initial
begin
	PC = 0;
end

always
begin
	// fetch
	MAR = PC;
	PC = PC + 1;
	//control signals to read
	tmp_en = 1;
	tmp_rwb = 1;
	#50;
	IR = memdata;

	//decode
	if (IR[11] == 0)
	begin
		case(IR[10:8])
			4'b0000:		// halt
				$finish;
		
			4'b0001:		// mov Rdest, Rsrc
			begin		
				if ((dest <= 11) && (src <= 11))
				begin
					REGS[dest] = REGS[src];
				end 
			end

			4'b0010:		// mov R, mem
			begin			
				MAR = IR[7:0];
				tmp_en = 1;
				tmp_rwb = 1;
				#50;
				MDR = memdata;
			end

			4'b0011:		// mov mem, R
			begin
				MAR = IR[7:0];
				tmp_memdata = MDR;
				tmp_en = 1;
				tmp_rwb = 0;
				#50;
			end	

			4'b0100:		// ldi acc
			begin
				REGS[0] = IR[7:0];			
			end
			
		endcase
		
	end
	else
	begin
		opcode = IR[10:8];
		ALU alu(REGS[src], REGS[dest], opcode, REGS[0]);
	end

end
	
endmodule




