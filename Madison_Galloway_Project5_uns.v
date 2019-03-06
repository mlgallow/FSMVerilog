
module Madison_Galloway_Project5 ( R, Y, G, clk, reset, start );
  input clk, reset, start;
  output R, Y, G;
  wire   N89, N91, N93, N94, N95, N130, N134, n24, n29, n30, n31, n32, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;
  wire   [3:0] pres_state;
  wire   [3:0] next_state;

  LATCHX1 \next_state_reg[0]  ( .CLK(N94), .D(N89), .Q(next_state[0]) );
  LATCHX1 \next_state_reg[2]  ( .CLK(N94), .D(N93), .Q(next_state[2]) );
  LATCHX1 \next_state_reg[1]  ( .CLK(N94), .D(N91), .Q(next_state[1]) );
  LATCHX1 \next_state_reg[3]  ( .CLK(N94), .D(N95), .Q(next_state[3]) );
  LATCHX1 Y_reg ( .CLK(N94), .D(n36), .Q(Y) );
  LATCHX1 G_reg ( .CLK(N94), .D(N134), .Q(G) );
  LATCHX1 R_reg ( .CLK(N94), .D(N130), .Q(R) );
  DFFARX1 \pres_state_reg[0]  ( .D(n32), .CLK(clk), .RSTB(n24), .Q(
        pres_state[0]) );
  DFFARX1 \pres_state_reg[2]  ( .D(n31), .CLK(clk), .RSTB(n24), .Q(
        pres_state[2]), .QN(n37) );
  DFFARX1 \pres_state_reg[1]  ( .D(n30), .CLK(clk), .RSTB(n24), .Q(
        pres_state[1]), .QN(n39) );
  DFFARX1 \pres_state_reg[3]  ( .D(n29), .CLK(clk), .RSTB(n24), .Q(
        pres_state[3]), .QN(n38) );
  INVX0 U31 ( .IN(n40), .QN(n36) );
  MUX21X1 U32 ( .IN1(pres_state[0]), .IN2(next_state[0]), .S(start), .Q(n32)
         );
  MUX21X1 U33 ( .IN1(pres_state[2]), .IN2(next_state[2]), .S(start), .Q(n31)
         );
  MUX21X1 U34 ( .IN1(pres_state[1]), .IN2(next_state[1]), .S(start), .Q(n30)
         );
  MUX21X1 U35 ( .IN1(pres_state[3]), .IN2(next_state[3]), .S(start), .Q(n29)
         );
  INVX0 U36 ( .IN(reset), .QN(n24) );
  OA21X1 U37 ( .IN1(n41), .IN2(n42), .IN3(n43), .Q(N95) );
  INVX0 U38 ( .IN(n44), .QN(n42) );
  AND3X1 U39 ( .IN1(n45), .IN2(n37), .IN3(pres_state[3]), .Q(n41) );
  NAND2X0 U40 ( .IN1(n40), .IN2(n46), .QN(N93) );
  NAND3X0 U41 ( .IN1(n37), .IN2(n38), .IN3(n47), .QN(n46) );
  NAND3X0 U42 ( .IN1(n45), .IN2(n38), .IN3(pres_state[2]), .QN(n40) );
  NOR2X0 U43 ( .IN1(pres_state[3]), .IN2(n43), .QN(N91) );
  XOR2X1 U44 ( .IN1(pres_state[0]), .IN2(n39), .Q(n43) );
  NAND2X0 U45 ( .IN1(pres_state[0]), .IN2(N94), .QN(N89) );
  INVX0 U46 ( .IN(n48), .QN(N94) );
  NAND2X0 U47 ( .IN1(n44), .IN2(n49), .QN(N134) );
  NAND3X0 U48 ( .IN1(n39), .IN2(n37), .IN3(pres_state[3]), .QN(n49) );
  NAND3X0 U49 ( .IN1(pres_state[2]), .IN2(n38), .IN3(n47), .QN(n44) );
  INVX0 U50 ( .IN(n45), .QN(n47) );
  NAND2X0 U51 ( .IN1(pres_state[1]), .IN2(pres_state[0]), .QN(n45) );
  AO21X1 U52 ( .IN1(n37), .IN2(n38), .IN3(n48), .Q(N130) );
  OA21X1 U53 ( .IN1(pres_state[1]), .IN2(pres_state[2]), .IN3(pres_state[3]), 
        .Q(n48) );
endmodule

