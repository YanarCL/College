Program qq;
Var
  c: array [,] of integer;
  i, j: integer;
Procedure neg(arr: array [,] of integer);
var
  a, b, sum: integer;
  s: array of integer;
  negative: boolean;
begin
  SetLength(s, 8);
  for a:=0 to 7 do
  begin
    negative:=False;
    for b:=0 to 7 do
    begin
      sum:=0;
      case a of
      0: sum+=arr[a+1,b];
      1..6: sum+=(arr[a+1,b]+arr[a-1,b]);
      7: sum+=arr[a-1,b];
      end;
      case b of
      0: sum+=arr[a,b+1];
      1..6: sum+=(arr[a,b+1]+arr[a,b-1]);
      7: sum+=arr[a,b-1];
      end;
      if sum=7 then
      begin
        negative:=True;
        break
      end
    end;
    if negative then s[a]:=-1
    else s[a]:=1
  end;
  for a:=0 to 7 do writeln(s[a])
end;
begin
  SetLength(c, 8, 8);
  randomize;
  for i:=0 to 7 do
  begin
    for j:=0 to 7 do 
    begin
       c[i,j]:=random(40) - 20;
       write(c[i,j], ' ')
    end;
    writeln(' ')
  end;
  writeln('Новый массив:');
  neg(c)
end.