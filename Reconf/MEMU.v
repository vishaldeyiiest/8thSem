
module(
input en,
input rwb,
input [7:0] memaddr,
inout [11:0] memdata

);

reg [11:0] MEM [255:0];

always @(en)
begin
	if (rwb == 1)
	begin
		memdata = MEM[memaddr];
	end
	
	else
		MEM[memaddr] = memdata;
end

endmodule

