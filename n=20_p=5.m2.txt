
--Hochster-Laksov två steg upp for n=20,p=5

n=20;
R=ZZ/5[x_1..x_n];
h = i -> hilbertFunction(i,R);
numeric h 5 / h 2

I = ideal apply(154,i->(((random(3,R)%ideal(x_19..x_n)))));
I = (I*x_19+I*x_20);
I2 = ideal apply(202-154,i->(random(3,R)));

m = (ideal(x_1..x_(18)))^5;


L = {};
for i in I_* do (
for j in (entries basis(1,R))_0 do (
	alpha= i*j ;
	L = append(L, alpha);
)
)
#L

timing(K = {};
for i in I2_* do (
for j in (entries basis(2,R))_0 do (
	alpha = i*j % m ;
	K = append(K,alpha);)
)
)
F = random(3,R);
for i in 0..83 do (
	bas = (entries basis(2,R))_0;
	alpha = F*bas_i % m;
	K = append(K,alpha);
)
#K


T = join(L,K);
timing numgens trim ideal T
