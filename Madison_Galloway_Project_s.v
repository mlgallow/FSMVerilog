
module Madison_Galloway_Project5 ( R, Y, G, clk, reset, start );
  input clk, reset, start;
  output R, Y, G;
  wire   N89, N91, N93, N95, N130, N134, n29, n30, n31, n32, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76;
  wire   [3:0] pres_state;
  wire   [3:0] next_state;

  LATCHX1 \next_state_reg[2]  ( .CLK(n66), .D(N93), .Q(next_state[2]) );
  LATCHX1 \next_state_reg[1]  ( .CLK(n66), .D(N91), .Q(next_state[1]) );
  LATCHX1 \next_state_reg[3]  ( .CLK(n66), .D(N95), .Q(next_state[3]) );
  LATCHX1 \next_state_reg[0]  ( .CLK(n66), .D(N89), .Q(next_state[0]) );
  LATCHX1 G_reg ( .CLK(n66), .D(N134), .Q(G) );
  LATCHX1 Y_reg ( .CLK(n66), .D(n65), .Q(Y) );
  LATCHX1 R_reg ( .CLK(n66), .D(N130), .Q(R) );
  DFFARX1 \pres_state_reg[3]  ( .D(n29), .CLK(clk), .RSTB(n61), .Q(
        pres_state[3]), .QN(n68) );
  DFFARX1 \pres_state_reg[1]  ( .D(n30), .CLK(clk), .RSTB(n61), .Q(
        pres_state[1]) );
  DFFARX1 \pres_state_reg[0]  ( .D(n32), .CLK(clk), .RSTB(n61), .Q(
        pres_state[0]) );
  DFFARX1 \pres_state_reg[2]  ( .D(n31), .CLK(clk), .RSTB(n61), .Q(
        pres_state[2]), .QN(n67) );
  AO21X1 U57 ( .IN1(n67), .IN2(n68), .IN3(n75), .Q(N130) );
  INVX0 U58 ( .IN(n75), .QN(n66) );
  NAND2X0 U59 ( .IN1(n69), .IN2(n73), .QN(N93) );
  NAND3X0 U60 ( .IN1(n67), .IN2(n68), .IN3(n64), .QN(n73) );
  INVX0 U61 ( .IN(n74), .QN(n64) );
  INVX0 U62 ( .IN(n69), .QN(n65) );
  AO22X1 U63 ( .IN1(pres_state[0]), .IN2(n62), .IN3(start), .IN4(next_state[0]), .Q(n32) );
  AO22X1 U64 ( .IN1(pres_state[3]), .IN2(n62), .IN3(next_state[3]), .IN4(start), .Q(n29) );
  AO22X1 U65 ( .IN1(pres_state[1]), .IN2(n62), .IN3(next_state[1]), .IN4(start), .Q(n30) );
  AO22X1 U66 ( .IN1(pres_state[2]), .IN2(n62), .IN3(next_state[2]), .IN4(start), .Q(n31) );
  INVX0 U67 ( .IN(start), .QN(n62) );
  OA21X1 U68 ( .IN1(pres_state[1]), .IN2(pres_state[2]), .IN3(pres_state[3]), 
        .Q(n75) );
  NAND2X0 U69 ( .IN1(pres_state[1]), .IN2(pres_state[0]), .QN(n74) );
  NAND3X0 U70 ( .IN1(pres_state[2]), .IN2(n68), .IN3(n64), .QN(n72) );
  NAND3X0 U71 ( .IN1(n74), .IN2(n68), .IN3(pres_state[2]), .QN(n69) );
  NOR2X0 U72 ( .IN1(pres_state[3]), .IN2(n71), .QN(N91) );
  OAI21X1 U73 ( .IN1(pres_state[0]), .IN2(pres_state[1]), .IN3(n74), .QN(n71)
         );
  OA21X1 U74 ( .IN1(n70), .IN2(n63), .IN3(n71), .Q(N95) );
  INVX0 U75 ( .IN(n72), .QN(n63) );
  NOR3X0 U76 ( .IN1(n64), .IN2(pres_state[2]), .IN3(n68), .QN(n70) );
  NAND2X0 U77 ( .IN1(pres_state[0]), .IN2(n66), .QN(N89) );
  NAND2X0 U78 ( .IN1(n72), .IN2(n76), .QN(N134) );
  OR3X1 U79 ( .IN1(pres_state[1]), .IN2(pres_state[2]), .IN3(n68), .Q(n76) );
  INVX0 U80 ( .IN(reset), .QN(n61) );
endmodule

