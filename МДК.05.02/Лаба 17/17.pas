program qq;
type
  PNode=^TNode;
  TNode=record
    value:integer;
    next:PNode;
    prev:PNode;
  end;
  TDeque=record
    front:PNode;
    rear:PNode;
  end;
procedure InitializeDeque(var deque:TDeque);
begin
  deque.front:=nil;
  deque.rear:=nil;
end;
function IsEmpty(deque:TDeque):boolean;
begin
  IsEmpty:=(deque.front=nil);
end;
procedure AddRear(var deque:TDeque;value:integer);
var
  newNode:PNode;
begin
  New(newNode);
  newNode^.value:=value;
  newNode^.next:=nil;
  newNode^.prev:=deque.rear;
  if IsEmpty(deque) then 
    deque.front:=newNode 
  else 
    deque.rear^.next:=newNode;
  deque.rear:=newNode;
end;
function RemoveRear(var deque:TDeque):integer;
var
  tempNode:PNode;
begin
  if IsEmpty(deque) then
  begin
    writeln('Deque is empty');
    Exit;
  end;
  tempNode:=deque.rear;
  RemoveRear:=tempNode^.value;
  deque.rear:=deque.rear^.prev;
  if deque.rear<>nil then 
    deque.rear^.next:=nil 
  else 
    deque.front:=nil;
  dispose(tempNode);
end;
var
  input,output:TextFile;
  deque:TDeque;
  number:integer;
  line:string;
begin
  InitializeDeque(deque);
  assignfile(input,'D:\2 курс\МДК.05.02\Лаба 17\input.txt');
  reset(input);
  while not eof(input) do
  begin
    readln(input,line);
    number:=StrToInt(line);
    AddRear(deque,number);
  end;
  close(input);
  assignfile(output,'D:\2 курс\МДК.05.02\Лаба 17\output.txt');
  Rewrite(output);
  while not IsEmpty(deque) do
  begin
    writeln(output,RemoveRear(deque));
  end;
  close(output);
  writeln('выполнено');
end.