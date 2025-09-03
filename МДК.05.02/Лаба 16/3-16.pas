program qq;////Создать список из десяти элементов и вывести его на экран. Затем вывести только четные элементы списка.
type
  PNode = ^TNode;
  TNode = record
    data: Integer;  
    next: PNode;    
  end;
var
  head, newNode, temp: PNode;  
  i, input: Integer;
begin
  head := nil;  
  writeLn('Введите 10 чисел:');
  for i:= 1 to 10 do
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
  writeLn('Все элементы списка:');
  temp := head;
  while temp <> nil do
  begin
    write(temp^.data, ' ');
    temp := temp^.next;
  end;
  writeln;
  writeln('Четные элементы списка:');
  temp := head;
  while temp <> nil do
  begin
    if temp^.data mod 2 = 0 then
      write(temp^.data, ' ');
    temp := temp^.next;
  end;
end.