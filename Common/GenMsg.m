function GenMsg(seed, length, fileName)
a=RandStream.create('mrg32k3a','NumStreams',1,'Seed',seed);
r=uint8(a.rand(1,round(length))*256);
f=fopen(fileName,'wb');
fwrite(f,r);
fclose(f);
end