
--Test för Hochster-Laksov två steg upp n=19, p=5


n=18;
R=ZZ/11[x_1..x_n];
h = i -> hilbertFunction(i,R);
numeric h 5 / h 2

I = ideal apply(114,i->(((random(3,R)%ideal(x_17..x_n)))));
I = (I*x_17+I*x_18);
I2 = ideal apply(154-114,i->(random(3,R)));

m = (ideal(x_1..x_(16)))^5;


L = {};
for i in I_* do (
for j in (entries basis(1,R))_0  do (
    alpha= i*j ;
    L = append(L, alpha);
)
)
#L

timing(K = {};
for i in I2_* do ( 
for j in (entries basis(2,R))_0  do (
       alpha = i*j % m ;
    K = append(K,alpha);)
)
)


T = join(L,K);
timing numgens trim ideal T
