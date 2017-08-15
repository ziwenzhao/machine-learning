clc;clear;clf;
%Initializaiton 
hn=6;
pn=24;
pan=20;
a=0.25;
w=0.5;
sc1=0.05;
sc2=0.01;
c1=2;c2=2;
vmax=0.5;
timesbep=0;timespso=0;
%creat the arrays of all values
o0=zeros(pn,5);
o1=zeros(pn,hn);
s0=zeros(pn,5);
s1=zeros(pn,hn);
delta0=zeros(1,5);
delta1=zeros(1,hn);
i=zeros(pn,64);
y=zeros(pn,5);
E=zeros(1,pn);
x0=(rand(5,hn,pan)-0.5)*2;
x1=(rand(hn,64,pan)-0.5)*2;
xb0=(rand(5,pan)-0.5)*2;
xb1=(rand(hn,pan)-0.5)*2;
v0=(rand(5,hn,pan)-0.5)*2;
v1=(rand(hn,64,pan)-0.5)*2;
vb0=(rand(5,pan)-0.5)*2;
vb1=(rand(hn,pan)-0.5)*2;
f=zeros(1,pan);
fbest=zeros(1,pan);
pbest0=zeros(5,hn,pan);
pbest1=zeros(hn,64,pan);
pbestb0=zeros(5,pan);
pbestb1=zeros(hn,pan);
pgbest0=zeros(5,hn);
pgbest1=zeros(hn,64);
pgbestb0=zeros(1,5);
pgbestb1=zeros(1,hn);
fl=zeros(1,pan);
%set all input and output patterns
%set pattern 1

for k=1:64
    if mod(k-5,8)==0
        i(1,k)=1;
    else i(1,k)=0;
    end
end
y(1,1)=1;y(1,2)=0;y(1,3)=0;y(1,4)=0;y(1,5)=0;
   
%set pattern 2
for k=1:64
    if mod(k-5,8)==0
        i(2,k)=1;
    else i(2,k)=0;
    end
end
i(2,4)=1;
y(2,1)=1;y(2,2)=0;y(2,3)=0;y(2,4)=0;y(2,5)=0;
%set pattern 3
for k=1:64
    if mod(k-5,8)==0
        i(3,k)=1;
    else i(3,k)=0;
    end
end
i(3,12)=1;i(3,60)=1;i(3,62)=1;
y(3,1)=1;y(3,2)=0;y(3,3)=0;y(3,4)=0;y(3,5)=0;
%set pattern 4
for k=1:64
    if mod(k-4,8)==0
        i(4,k)=1;
    else i(4,k)=0;
    end
end
y(4,1)=1;y(4,2)=0;y(4,3)=0;y(4,4)=0;y(4,5)=0;
%set pattern 5
for k=1:64
    if mod(k-4,8)==0
        i(5,k)=1;
    else i(5,k)=0;
    end
end
i(5,3)=1;
y(5,1)=1;y(5,2)=0;y(5,3)=0;y(5,4)=0;y(5,5)=0;
%set pattern 6
for k=1:8
    i(6,k)=1;
end
i(6,16)=1;
i(6,24)=1;
for k=1:8
    i(6,24+k)=1;
end
i(6,33)=1;i(6,41)=1;i(6,49)=1;
for k=1:8
   i(6,56+k)=1;
end
y(6,1)=0;y(6,2)=1;y(6,3)=0;y(6,4)=0;y(6,5)=0;
%set pattern 7
for k=1:8
    i(7,k)=1;
end
i(7,16)=1;i(7,24)=1;i(7,32)=1;
for k=1:8
    i(7,32+k)=1;
end
i(7,41)=1;i(7,49)=1;
for k=1:8
   i(7,56+k)=1;
end
y(7,1)=0;y(7,2)=1;y(7,3)=0;y(7,4)=0;y(7,5)=0;
%set pattern 8
for k=1:6
    i(8,1+k)=1;
end
i(8,9)=1;i(8,16)=1;i(8,24)=1;
for k=1:6
    i(8,25+k)=1;
end
i(8,33)=1;i(8,41)=1;i(8,49)=1;
for k=1:8
    i(8,56+k)=1;
end
y(8,1)=0;y(8,2)=1;y(8,3)=0;y(8,4)=0;y(8,5)=0;
%set pattern 9
for k=1:6
    i(9,1+k)=1;
end
i(9,9)=1;i(9,16)=1;i(9,24)=1;i(9,32)=1;
for k=1:6
    i(9,33+k)=1;
end
i(9,41)=1;i(9,49)=1;
for k=1:8
    i(9,56+k)=1;
end
y(9,1)=0;y(9,2)=1;y(9,3)=0;y(9,4)=0;y(9,5)=0;
%set pattern 10
for k=1:6
    i(10,1+k)=1;
end
i(10,9)=1;i(10,16)=1;i(10,24)=1;
i(10,31)=1;
i(10,37)=1;i(10,38)=1;
i(10,43)=1;i(10,44)=1;
i(10,50)=1;
for k=1:8
    i(10,56+k)=1;
end
y(10,1)=0;y(10,2)=1;y(10,3)=0;y(10,4)=0;y(10,5)=0;
%set pattern 11
for k=1:8
    i(11,k)=1;
end
for k=1:6
    i(11,(k+1)*8)=1;
end
for k=1:5
    i(11,26+k)=1;
end
for k=1:8
    i(11,56+k)=1;
end
y(11,1)=0;y(11,2)=0;y(11,3)=1;y(11,4)=0;y(11,5)=0;
input11=zeros(8);
%set pattern 12
for k=1:6
    i(12,1+k)=1;
end
i(12,9)=1;i(12,16)=1;i(12,24)=1;
for k=1:5
    i(12,26+k)=1;
end
i(12,40)=1;i(12,48)=1;i(12,56)=1;i(12,49)=1;
for k=1:6
    i(12,57+k)=1;
end
y(12,1)=0;y(12,2)=0;y(12,3)=1;y(12,4)=0;y(12,5)=0;
%set pattern 13
for k=1:8
    i(13,k)=1;
end
for k=1:6
    i(13,(k+1)*8)=1;
end
for k=1:7
    i(13,32+k)=1;
end
for k=1:8
    i(13,56+k)=1;
end
y(13,1)=0;y(13,2)=0;y(13,3)=1;y(13,4)=0;y(13,5)=0;
%set pattern 14
for k=1:8
    i(14,k)=1;
end
for k=1:6
    i(14,(k+1)*8)=1;
end
for k=1:5
    i(14,34+k)=1;
end
for k=1:8
    i(14,56+k)=1;
end
y(14,1)=0;y(14,2)=0;y(14,3)=1;y(14,4)=0;y(14,5)=0;
%set pattern 15
i(15,[2:7,9,16,24,32,35:39,48,49,56,58:63])=1;
y(15,1)=0;y(15,2)=0;y(15,3)=1;y(15,4)=0;y(15,5)=0;
%set pattern 16
i(16,[1,8,9,16,17,24,25,32:40,48,56,64])=1;
y(16,1)=0;y(16,2)=0;y(16,3)=0;y(16,4)=1;y(16,5)=0;
%set pattern 17
for k=1:5
    i(17,(k-1)*8+1)=1;
end
for k=1:7
    i(17,33+k)=1;
end
for k=1:8
    i(17,(k-1)*8+7)=1;
end
y(17,1)=0;y(17,2)=0;y(17,3)=0;y(17,4)=1;y(17,5)=0;
%set pattern 18
for k=1:4
    i(18,7*k-2)=1;
end
for k=1:7
    i(18,32+k)=1;
end
for k=1:8
    i(18,8*k)=1;
end
y(18,1)=0;y(18,2)=0;y(18,3)=0;y(18,4)=1;y(18,5)=0;
%set pattern 19
for k=1:4
    i(19,7*k-2)=1;
end
for k=1:8
    i(19,32+k)=1;
end
for k=1:8
    i(19,(k-1)*8+7)=1;
end
y(19,1)=0;y(19,2)=0;y(19,3)=0;y(19,4)=1;y(19,5)=0;
%set pattern 20
i(20,7)=1;i(20,13)=1;i(20,14)=1;i(20,19)=1;i(20,20)=1;i(20,26)=1;
for k=1:7
    i(20,32+k)=1;
end
for k=1:8
    i(20,8*k)=1;
end
y(20,1)=0;y(20,2)=0;y(20,3)=0;y(20,4)=1;y(20,5)=0;
%set pattern 21
for k=1:8
    i(21,k)=1;
end
i(21,9)=1;i(21,17)=1;
for k=1:8
    i(21,24+k)=1;
end
for k=1:3
    i(21,(4+k)*8)=1;
end
for k=1:8
    i(21,56+k)=1;
end
y(21,1)=0;y(21,2)=0;y(21,3)=0;y(21,4)=0;y(21,5)=1;
%set pattern 22
for k=1:8
    i(22,k)=1;
end
i(22,9)=1;i(22,17)=1;
for k=1:7
    i(22,24+k)=1;
end
i(22,40)=1;i(22,48)=1;i(22,56)=1;i(22,49)=1;
for k=1:6
    i(22,57+k)=1;
end
y(22,1)=0;y(22,2)=0;y(22,3)=0;y(22,4)=0;y(22,5)=1;
%set pattern 23
for k=1:8
    i(23,k)=1;
end
i(23,9)=1;i(23,17)=1;i(23,25)=1;
for k=1:8
    i(23,32+k)=1;
end
i(23,48)=1;i(23,56)=1;
for k=1:8
    i(23,56+k)=1;
end
y(23,1)=0;y(23,2)=0;y(23,3)=0;y(23,4)=0;y(23,5)=1;
%set pattern 24
i(24,[1:8,9,17,25,33:39,48,49,56,58:63])=1;
y(24,1)=0;y(24,2)=0;y(24,3)=0;y(24,4)=0;y(24,5)=1;

itest(1,:)=zeros(1,64);
itest(1,[4,12,20,28,37,45,53,61])=1;
itest(2,:)=zeros(1,64);
itest(2,[2:7,9,16,24,29:31,34:36,41,49,57:64])=1;
itest(3,:)=zeros(1,64);
itest(3,[2:7,9,16,24,29:32,40,48,49,56,58:63])=1;
itest(4,:)=zeros(1,64);
itest(4,[6,7,13,15,19,20,23,26,31,33:40,47,55,63])=1;
itest(5,:)=zeros(1,64);
itest(5,[1:8,9,17,25:28,37:40,48,49,56,58:63])=1;


%find initialed weights position based on PSO

%calculate all fi
for pa=1:pan
    %calculate ith cost function(Epsum)
    for p=1:pn
        %calculate the output of loopth pattern
        %calculate sum of hidden layer
    for j=1:hn
        product=x1(j,:,pa).*i(p,:);
        s1(p,j)=xb1(j,pa)+sum(product(:));
    end
    %calculate output of hidden layer
    o1(p,:)=1./(1+exp(-s1(p,:)));

    %calculate sum of 5 output units
    for k=1:5
        product=x0(k,:,pa).*o1(p,:);
        s0(p,k)=xb0(k,pa)+sum(product(:));
    end
    %calculate 5 output nodes
    o0(p,:)=1./(1+exp(-s0(p,:)));
    %Calculate Ep
    difference2=(y(p,:)-o0(p,:)).^2;
    E(p)=0.5*sum(difference2(:));
    end
    %calculate Epsum
    Epsum=sum(E(:));
    f(pa)=Epsum;
end

%find personal fbest and pbest
fbest=f;
pbest0=x0;pbest1=x1;pbestb0=xb0;pbestb1=xb1;
%find group fgbest and pgbest
fgbest(1)=f(1);pgbest0=x0(:,:,1); pgbest1=x1(:,:,1);pgbestb0=xb0(:,1);pgbestb1=xb1(:,1);
for pa=2:pan
    if fgbest(1)>f(pa)
        fgbest(1)=f(pa);
        pgbest0=x0(:,:,pa); pgbest1=x1(:,:,pa);pgbestb0=xb0(:,pa);pgbestb1=xb1(:,pa);
    end
end
%repeat particles moving and searching best position
while fgbest(timespso+1)>sc1
    for pa=1:pan
        %update all elements of path vi
        %update all elements of part 0 of path v
        for k=1:5
            for j=1:hn
                r1=rand(1);r2=rand(1);
                v0(k,j,pa)=w*v0(k,j,pa)+c1*r1*(pbest0(k,j,pa)-x0(k,j,pa))+c2*r2*(pgbest0(k,j)-x0(k,j,pa));
            end
        end
        %update all elements of part 1 of path v
        
        for k=1:hn
            for j=1:64
                r1=rand(1);r2=rand(1);
                v1(k,j,pa)=w*v1(k,j,pa)+c1*r1*(pbest1(k,j,pa)-x1(k,j,pa))+c2*r2*(pgbest1(k,j)-x1(k,j,pa));
            end
        end
        %update all elements of part b0 of path v
        
        for k=1:5
            r1=rand(1);r2=rand(1);
            vb0(k,pa)=w*vb0(k,pa)+c1*r1*(pbestb0(k,pa)-xb0(k,pa))+c2*r2*(pgbestb0(k)-xb0(k,pa));
        end
        %update all elements of part b1 of path v
        
        for k=1:hn
            r1=rand(1);r2=rand(1);
            vb1(k,pa)=w*vb1(k,pa)+c1*r1*(pbestb1(k,pa)-xb1(k,pa))+c2*r2*(pgbestb1(k)-xb1(k,pa));
        end
        %set boundary for all v
        for k=1:5
            for j=1:hn
                if v0(k,j,pa)>vmax
                    v0(k,j,pa)=vmax;
                end
                if v0(k,j,pa)<-vmax
                        v0(k,j,pa)=-vmax;
                end
            end
        end
        for k=1:hn
            for j=1:64
                if v1(k,j,pa)>vmax
                    v1(k,j,pa)=vmax;
                end
                if v1(k,j,pa)<-vmax
                    v1(k,j,pa)=-vmax;
                end
            end
        end
        for k=1:5
            if vb0(k,pa)>vmax
                vb0(k,pa)=vmax;
            end
            if vb0(k,pa)<-vmax
                vb0(k,pa)=-vmax;
            end
        end
        for k=1:hn
            if vb1(k,pa)>vmax
                vb1(k,pa)=vmax;
            end
            if vb1(k,pa)<-vmax
                vb1(k,pa)=-vmax;
            end
        end                      
        %update each xi
        x0(:,:,pa)=x0(:,:,pa)+v0(:,:,pa);
        x1(:,:,pa)=x1(:,:,pa)+v1(:,:,pa);
        xb0(:,pa)=xb0(:,pa)+vb0(:,pa);
        xb1(:,pa)=xb1(:,pa)+vb1(:,pa);
    end 
    %calculate all fi
    for pa=1:pan
        %calculate ith cost function(Epsum)
        for p=1:pn
            %calculate the output of pth pattern
            %calculate sum of hidden layer
            for j=1:hn
                product=x1(j,:,pa).*i(p,:);
                s1(p,j)=xb1(j,pa)+sum(product(:));
            end
            %calculate output of hidden layer
            o1(p,:)=1./(1+exp(-s1(p,:)));
            %calculate sum of 5 output units
            for k=1:5
                product=x0(k,:,pa).*o1(p,:);
                s0(p,k)=xb0(k,pa)+sum(product(:));
            end
            %calculate 5 output nodes
            o0(p,:)=1./(1+exp(-s0(p,:)));
            %Calculate Ep
            difference2=(y(p,:)-o0(p,:)).^2;
            E(p)=0.5*sum(difference2(:));
        end
        %calculate Epsum
        Epsum=sum(E(:));
        f(pa)=Epsum;
    end
    %optimize fibest and pibest
    for pa=1:pan
        %update each fbesti & pbesti
        if fbest(pa)>f(pa)
            fbest(pa)=f(pa);
            pbest0(:,:,pa)=x0(:,:,pa);
            pbest1(:,:,pa)=x1(:,:,pa);
            pbestb0(:,pa)=xb0(:,pa);
            pbestb1(:,pa)=xb1(:,pa);
        end

    end
    %optimize fgbest and pgbest
    for pa=1:pan
        %fgbest=min(fgbest,f(pa)),update pgbest;
        fgbest(timespso+2)=fgbest(timespso+1);
        if fgbest(timespso+2)>f(pa)
           fgbest(timespso+2)=f(pa);
            %pgbest=x(pa);
            pgbest0=x0(:,:,pa);
            pgbest1=x1(:,:,pa);
            pgbestb0=xb0(:,pa);
            pgbestb1=xb1(:,pa);
        end
    end
    timespso=timespso+1;
end





%train NN system based on BEP with initialed weights achieved in PSO
%Initial weights
w0=pgbest0;
w1=pgbest1;
b0=pgbestb0';
b1=pgbestb1';





%train the system
%calculate outputs for all patterns
Epsum(1)=fgbest(timespso+1);
  %update echo
 while Epsum(timesbep+1)>sc2
     
       %update weights
       for p=1:pn
           %update weights based on pattern pth.
           %calculate delta0pk k=1:5
           delta0(p,:)=(y(p,:)-o0(p,:)).*exp(-s0(p,:))./(1+exp(-s0(p,:))).^2;
           %calculate delta1pj j=1:hn
           for j=1:hn
               product=delta0(p,:).*(w0(:,j))';
               delta1(p,j)=sum(product(:))*exp(-s1(p,j))/(1+exp(-s1(p,j)))^2;
           end
           %update weights on the output layer
           w0=w0+a*(delta0(p,:))'*o1(p,:);
           %update bias of output layer
           b0=b0+a*delta0(p,:);
           %update weights of hidden layer
           w1=w1+a*delta1(p,:)'*i(p,:);
           %update bias of hidden layer
           b1=b1+a*delta1(p,:);
       end
       %calculate outputs for all patterns
       for p=1:pn
           %calculate the output of pth pattern
           %calculate sum of hidden layer
           for j=1:hn
               product=w1(j,:).*i(p,:);
               s1(p,j)=b1(j)+sum(product(:));
           end
           %calculate output of hidden layer
           o1(p,:)=1./(1+exp(-s1(p,:)));
           %calculate sum of 5 output units
           for k=1:5
               product=w0(k,:).*o1(p,:);
               s0(p,k)=b0(k)+sum(product(:));
           end
           %calculate 5 output nodes
           o0(p,:)=1./(1+exp(-s0(p,:)));
           %Calculate Ep
           difference2=(y(p,:)-o0(p,:)).^2;
           E(p)=0.5*sum(difference2(:));
       end
       %calculate Epsum
       Epsum(timesbep+2)=sum(E(:));
       timesbep=timesbep+1;
end
 