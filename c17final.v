module MUX21 (x, y, w, out1);

input x, y, w;
output reg out1;

always @ (*)
if (w == 1'b0)
out1 = x;
else 
out1 = y;
endmodule 
module c17 (N1, N2, N3, N6, N7, N22, N23,s1,s2,random);

input N1, N2, N3, N6, N7,s1,s2,random; output N22, N23;

wire N10, N11, N16, N19,o1,o2;
reg G1, G2; 

always @ (*)
begin
G1 = random * N16;
G2 = random * N19;
end 

nand NAND2_1 (N10, N1, N3); nand NAND2_2 (N11, N3, N6);

nand NAND2_3 (N16, N2, N11);


nand NAND2_4 (N19, N11, N7); 
MUX21 mx1 (G1, N16, s1, o1);
MUX21 mx2 (N19, G2, s2, o2);
nand NAND2_5 (N22, N10, o1);

nand NAND2_6 (N23, o1, o2);

endmodule
/* Test Bench */
module testc17;
reg s1,s2, N1, N2, N3, N6,N7,random;
wire N22, N23;
c17 m(N1, N2, N3, N6, N7, N22, N23,s1,s2,random);

endmodule



.............
CUT - dynamic obf - active ic meterign - time based logic - benchmark ckts testing
