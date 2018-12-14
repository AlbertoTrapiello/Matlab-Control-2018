NUM = 1;
DEN = [1 6 11 6];
G = tf(NUM, DEN)
step(G);
[A,B,C,D] = tf2ss (NUM, DEN);
p = [-10 -11 -20];
k1 = place (A,B,p);
Ar1 = A -B*k1;
hold on
step (Ar1,B,C,D);
Q1=[100 0 0;0 1 0;0 0 1]
R=10;
k2= lqr(A,B,Q1,R)
Ar2 = A -B*k2;
%figure();
step (Ar2,B,C,D);
