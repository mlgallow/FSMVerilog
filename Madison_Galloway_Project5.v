module Madison_Galloway_Project5(R,Y,G,clk,reset,start);
	input clk,reset,start;
	output R,Y,G;
	reg R,Y,G;
	reg [3:0] pres_state, next_state;	
	parameter st0 = 4'b0000, st1 = 4'b0001, st2 = 4'b0010, st3 = 4'b0011, st4 =4'b0100, st5 = 4'b0101, st6 = 4'b0110,st7 = 4'b0111, st8 = 4'b1000, st9 = 4'b1001;
	//FSM register
	always @(posedge clk or posedge reset)
	//statereg
	begin: statereg
		if(reset)
			begin
			pres_state <= st0;
			end
		else if(start == 1)
			begin
			pres_state <= next_state;
			end
	end//statereg

	//FSM next state logic
	always @(pres_state)
	begin: fsm
	//st0:red
	if (pres_state == st0)
		begin
		next_state <= st1;
		end
	//st1 : red
	if (pres_state == st1)
		begin
		next_state <= st2;
		end
	//st2: red
	if (pres_state == st2)
		begin
		next_state <= st3;
		end
	//st3: red
	if (pres_state == st3)
		begin
		next_state <= st4;
		end
	//st4: yellow
	if (pres_state == st4)
		begin
		next_state <= st5;
		end
	//st5: yellow
	if (pres_state == st5)
		begin
		next_state <= st6;
		end
	//st6: yellow
	if (pres_state == st6)
		begin
		next_state <= st7;
		end
	//st7: green
	if (pres_state == st7)
		begin
		next_state <= st8;
		end
	//st8: green
	if (pres_state == st8)
		begin
		next_state <= st9;
		end
	//st9: green
	if (pres_state == st9)
		begin
		next_state <= st0;
		end
	end
	
	//Moore output definition using Pres_state only
	always @(pres_state)
	//outputs
	begin: outputs
	if (pres_state == st0)
		begin
			R <= 1'b1;
			Y <= 1'b0;
			G <= 1'b0;
		end
	if (pres_state == st1)
		begin
			R <= 1'b1;
			Y <= 1'b0;
			G <= 1'b0;
		end
	if (pres_state == st2)
		begin
			R <= 1'b1;
			Y <= 1'b0;
			G <= 1'b0;
		end
	if (pres_state == st3)
		begin
			R <= 1'b1;
			Y <= 1'b0;
			G <= 1'b0;
		end
	if (pres_state == st4)
		begin
			R <= 1'b0;
			Y <= 1'b1;
			G <= 1'b0;
		end
	if (pres_state == st5)
		begin
			R <= 1'b0;
			Y <= 1'b1;
			G <= 1'b0;
		end
	if (pres_state == st6)
		begin
			R <= 1'b0;
			Y <= 1'b1;
			G <= 1'b0;
		end
	if (pres_state == st7)
		begin
			R <= 1'b0;
			Y <= 1'b0;
			G <= 1'b1;
		end
	if (pres_state == st8)
		begin
			R <= 1'b0;
			Y <= 1'b0;
			G <= 1'b1;
		end
	if (pres_state == st9)
		begin
			R <= 1'b0;
			Y <= 1'b0;
			G <= 1'b1;
		end
	end
endmodule
