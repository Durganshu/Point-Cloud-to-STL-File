fid     = fopen('gjhj.stl','r');
regex   = '\s*vertex\s*([-]?(?:[0-9]*[.])?[0-9]+)\s*([-]?(?:[0-9]*[.])?[0-9]+)\s*([-]?(?:[0-9]*[.])?[0-9]+)';
line_ex = fgetl(fid);
i = 1;
j = 1;
while ~feof(fid)
    line_ex = fgetl(fid);
    if regexp(line_ex,regex)
        toks   = regexp(line_ex, regex, 'tokens');
        %- Points
        p{i,1} = str2double(toks{:}{1});
        p{i,2} = str2double(toks{:}{3});
        p{i,3} = str2double(toks{:}{2});
        %p{i,4} = 1;
        %- Counter
        i = i + 1;
    end
end
fclose(fid);
%- Indices.
k = 1;
for j = 1:(size(p,1)/3)
    t{j,1} = k;
    t{j,2} = k+1;
    t{j,3} = k+2;
    k = k + 3;
end

t = double(cell2mat(t));
p = double(cell2mat(p));
TR = triangulation(t,p);
trisurf(TR);
h = polar(1,1,'*r')
set(gca, 'CameraViewAngleMode', 'manual', 'CameraTargetMode', 'manual', ...
         'CameraPositionMode', 'manual');
for k = linspace(0, pi, 100)
  set(gca, 'CameraUpVector', [sin(k), cos(k), 0]);
  pause(0.01);
end