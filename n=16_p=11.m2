n=16;
R=ZZ/11[x_1..x_n];
h = i -> hilbertFunction(i,R);
numeric h 5 / h 2

I = ideal apply(68,i->(((random(3,R)%ideal(x_14..x_n)))));
I = (I*x_14 + I*x_15 + I*x_16);
I2 = ideal apply(114-68,i->(random(3,R)));

m = (ideal(x_1..x_(13)))^5;


L = {};
for i in I_* do (
for j in (entries basis(1,R))_0  do (
    alpha= i*j ;
    L = append(L, alpha);
)
)
#L

timing(K = {};
ind=0;
for i in I2_* do ( print ind; ind=ind+1;
for j in (entries basis(2,R))_0  do (
       alpha = i*j % m;
    K = append(K,alpha);)
)
)
#K

T = join(L,K);
timing numgens trim ideal T
