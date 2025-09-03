program qq;
uses GraphABC;
begin
  circle(100,200,50);
  Floodfill (100,200,clred);
  circle(500,200,50);
  Floodfill (500,200,clyellow);
  line(150,200,450,200);
  line(150,200,300,300);
  line(450,200,300,300);
  Floodfill (400,201,clLime);
  line(150,200,300,100);
  line(450,200,300,100);
  Floodfill (400,199,clblue);
end.