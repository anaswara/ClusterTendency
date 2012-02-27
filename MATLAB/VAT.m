function [P,MST, clusters]=VAT(R);

[N,M]=size(R);

J=1:N;
P=zeros(1,N);

[y,i]=max(R);
[y,j]=max(y);
P(1)=i(j);
I=i(j);
J(I)=[];
[y,j]=min(R(I,J));
MST(1)=y;
P(2)=J(j);
I=[I J(j)];
J(J==J(j))=[];

for r=3:N-1,
    [y,i]=min(R(I,J));
    [y,j]=min(y);
    MST(r-1)=y;
    P(r)=J(j);
    I=[I J(j)];
    J(J==J(j))=[];
end;
P(N)=J;

RV=R(P,P);
strmat = cell(size(P,2),size(P,2));
for i = 1:size(P,2)
    for j = 1:size(P,2)
        strmat{i,j} = strcat(strcat(int2str(P(i)), ',' ),int2str(P(j)));
    end
end
clusters = strmat;
figure;
imagesc(RV);
colormap(gray(256));
axis image;
