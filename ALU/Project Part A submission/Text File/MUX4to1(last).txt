Library ieee;
Use ieee.std_logic_1164.all;

Entity Mux4to1 is

Port
( S0, S1, I0, I1, I2, I3  : in bit ;
  Mux_Out 		  : out bit ) ;

End Mux4to1 ;



Architecture arc_M of Mux4to1 is


Component AND_2

Port(a_1,a_2 : in bit ;
     Out_1   : out bit );

End component;

Component OR_2

Port(o_1,o_2 : in bit ;
     Out_2   : out bit );

End component;

Component NOT_1

Port (n_1   : in bit ;
      Out_3 : out bit);

End component;


Signal T0, T1, A_0, A_1, A_2, A_3, Q_0, Q_1, Q_2, Q_3, R_01, R_23 : bit;


Begin

N0 : NOT_1

Port map ( S0 , T0 ) ;

N1 : NOT_1

Port map ( S1 , T1 ) ;

A0 : AND_2

Port map ( T0 , T1 , A_0 ) ;

A2 : AND_2

Port map ( T0 , S1 , A_2 ) ;

A1 : AND_2

Port map ( S0 , T1 , A_1 ) ;

A3 : AND_2

Port map ( S0 , S1 , A_3 ) ;

Q0 : AND_2

Port map ( A_0 , I0 , Q_0 ) ;

Q1 : AND_2

Port map ( A_1 , I1 , Q_1 ) ;

Q2 : AND_2

Port map ( A_2 , I2 , Q_2 ) ;

Q3 : AND_2

Port map ( A_3 , I3 , Q_3 ) ;

R01 : OR_2

Port map ( Q_0 , Q_1 , R_01 ) ;

R23 : OR_2

Port map ( Q_2 , Q_3 , R_23 ) ;

R0123 : OR_2

Port map ( R_01 , R_23 , Mux_Out ) ;


End arc_M ;