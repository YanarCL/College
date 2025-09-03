program qq; ////Дан односвязный (линейный) список. Найти максимальный и минимальный элементы в списке.
type
  PNode = ^TNode;  
  TNode = record
    data:integer; 
    next: PNode;    
  end;
var
  head, newNode, temp: PNode;  
  i, input, max, min: integer;
  first: boolean;

begin
  head := nil;  
  writeln('Введите 10 чисел:');
  for i := 1 to 10 do
  begin
    write('Число ', i, ': ');
    readln(input); 
    New(newNode);  
    newNode^.data := input;
    newNode^.next := nil;
    if head = nil then
      head := newNode
    else
    begin
      temp := head;
      while temp^.next <> nil do
        temp := temp^.next;  
      temp^.next := newNode;  
    end;
  end;
  max := head^.data;
  min := head^.data;
  first := True;
  temp := head;
  while temp <> nil do
  begin
    if first then
    begin
      max := temp^.data;
      min := temp^.data;
      first := False;
    end
    else
    begin
      if temp^.data > max then
        max := temp^.data;
      if temp^.data < min then
        min := temp^.data;
    end;
    temp := temp^.next;
  end;
  writeLn('Максимальный элемент: ', max);
  writeLn('Минимальный элемент: ', min);
end.