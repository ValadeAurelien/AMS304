function write_meshfile(fid,XYZ,ELEM)

%vertices
fprintf(fid,'MeshVersionFormatted\n');
fprintf(fid,'1\n');
fprintf(fid,'Dimension\n');
fprintf(fid,'3\n');
fprintf(fid,'Vertices\n');
fprintf(fid,'%d\n',size(XYZ,1));
fprintf(fid,'%f %f %f 1 \n',XYZ');

%elem
fprintf(fid,'Triangles\n');
fprintf(fid,'%d \n',size(ELEM,1));
fprintf(fid,'%d %d %d 1 \n',ELEM');

fprintf(fid,'End\n');