module MUX21 (x, y, w, out1);

input x, y, w;
output reg out1;

always @ (*)
if (w == 1'b0)
out1 = x;
else 
out1 = y;
endmodule
module dff (CK,Q,D);
input CK,D;
output Q;

  wire NM,NCK;
  trireg NQ,M;

  nmos N7 (M,D,NCK);
  not P3 (NM,M);
  nmos N9 (NQ,NM,CK);
  not P5 (Q,NQ);
  not P1 (NCK,CK);

endmodule

module s27(GND,VDD,CK,G0,G1,G17,G2,G3,s1,s2,random);
input GND,VDD,CK,G0,G1,G2,G3,s1,s2,random;
output G17;

  wire G5,G10,G6,G11,G7,G13,G14,G8,G15,G12,G16,G9,o1,o2;
reg L1, L2; 

always @ (*)
begin
L1 = random * G11;
L2 = random * G14;
end 

  dff DFF_0(CK,G5,G10);
  dff DFF_1(CK,G6,o1);
  dff DFF_2(CK,G7,G13);
  not NOT_0(G14,G0);
  not NOT_1(G17,o1);
  and AND2_0(G8,G14,G6);
  or OR2_0(G15,G12,G8);
  or OR2_1(G16,G3,G8);
  nand NAND2_0(G9,G16,G15);
  nor NOR2_0(G10,o1,o2);
  nor NOR2_1(G11,G5,G9);
MUX21 mx1 (L1, G11, s1, o1);
MUX21 mx2 (G14, L2, s2, o2);

  nor NOR2_2(G12,G1,G7);
  nor NOR2_3(G13,G2,G12);

endmodule

