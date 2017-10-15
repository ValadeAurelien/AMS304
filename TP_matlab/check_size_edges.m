function check_size_edges(XYZfin,ELEMnew)

E1=ELEMnew(:,1);
E2=ELEMnew(:,2);
E3=ELEMnew(:,3);

nbElemnew=size(ELEMnew,1);

for k=1:nbElemnew;
	inter1 = 0.0;
	inter2 = 0.0;
	inter3 = 0.0;
	for l=1:3;
		inter1 = inter1+(XYZfin(E1(k),l)-XYZfin(E2(k),l))^2;
		inter2 = inter2+(XYZfin(E2(k),l)-XYZfin(E3(k),l))^2;
		inter3 = inter3+(XYZfin(E1(k),l)-XYZfin(E3(k),l))^2;
	end;
	mat_size(k,1)=sqrt(inter1);
	mat_size(k,2)=sqrt(inter2);
	mat_size(k,3)=sqrt(inter3);

end	
mat_moy  = sum(mat_size,2)/3;
mat_min=min(mat_size,[],2);
mat_max=max(mat_size,[],2);

size_moy = sum(mat_moy,1)/nbElemnew;
size_min = min(mat_min,[],1);
size_max = max(mat_max,[],1);

fprintf('\nAverage, Min and Max Sizes: %1.4f %1.4f %1.4f;\n\n',size_moy, ...
    size_min,size_max);

 