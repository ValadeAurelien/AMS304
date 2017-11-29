function [ELEM]=check_normal_cavity(XYZ,ELEM,nbElem)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CHECK THE NORMAL                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X1 = XYZ(ELEM(:,1),:);
X2 = XYZ(ELEM(:,2),:);
X3 = XYZ(ELEM(:,3),:);
a1=X1-X3;
a2=X2-X3;
normal = cross(a1,a2);
XYZg = [ sum(X1(:,1) + X2(:,1) + X3(:,1),2)/3, sum(X1(:,2) + X2(:,2) ...
    + X3(:,2),2)/3,sum(X1(:,3) + X2(:,3) + X3(:,3),2)/3];

l=0;
for k=1:nbElem;
    if sqrt((XYZg(k,1)+normal(k,1))^2+(XYZg(k,2)+normal(k,2))^2+(XYZg(k,3)+normal(k,3))^2) <= 1
        %disp(['normal: wrong way'])
        l=l+1;
        ELEMcopie = ELEM(k,:);
        ELEM(k,1)=ELEMcopie(3);
        ELEM(k,2)=ELEMcopie(2);
        ELEM(k,3)=ELEMcopie(1);
    end
end

fprintf('We have modified %d Normals out of %d Elements\n',l,nbElem);
 


