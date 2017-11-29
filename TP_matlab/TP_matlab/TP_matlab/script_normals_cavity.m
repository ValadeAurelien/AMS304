

file_name_in='sphere_mesh_0';
fid1=fopen('./status_error.log','w');
fid2=fopen('./sphere_mesh_0b.mesh','w'); 

%Read mesh
[coor,tri,ref_tri]=read_meshfile(file_name_in,fid1);
nbElem=size(tri,1)
nbNode=size(coor,1)

[tri]=check_normal_cavity(coor,tri,nbElem);

check_size_edges(coor,tri)

 

X1 = coor(tri(:,1),:);
X2 = coor(tri(:,2),:);
X3 = coor(tri(:,3),:);
a1=X1-X3;
a2=X2-X3;
normal = cross(a1,a2);
XYZg = [ sum(X1(:,1) + X2(:,1) + X3(:,1),2)/3, sum(X1(:,2) + X2(:,2) ...
    + X3(:,2),2)/3,sum(X1(:,3) + X2(:,3) + X3(:,3),2)/3];


figure;
trimesh(tri,coor(:,1),coor(:,2),coor(:,3));
hold on;
quiver3(XYZg(:,1),XYZg(:,2),XYZg(:,3),normal(:,1),normal(:,2),normal(:,3));
axis 'equal';
write_meshfile(fid2,coor,tri)