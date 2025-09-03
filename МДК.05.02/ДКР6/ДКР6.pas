program QueueExample;

const
  MaxSize = 100;  // Максимальный размер очереди

type
  Queue = record
    data: array[1..MaxSize] of integer;
    front, rear: integer;
  end;

var
  q: Queue;

procedure InitializeQueue(var q: Queue);
begin
  q.front := 1;
  q.rear := 0;
end;

function IsEmpty(var q: Queue): boolean;
begin
  IsEmpty := q.rear < q.front;
end;

function IsFull(var q: Queue): boolean;
begin
  IsFull := q.rear = MaxSize;
end;

procedure Enqueue(var q: Queue; x: integer);
begin
  if IsFull(q) then
    writeln('Очередь полна, невозможно добавить элемент.')
  else
  begin
    q.rear := q.rear + 1;
    q.data[q.rear] := x;
  end;
end;

function Dequeue(var q: Queue): integer;
begin
  if IsEmpty(q) then
  begin
    writeln('Очередь пуста, невозможно удалить элемент.');
    Dequeue := -1; 
  end
  else
  begin
    Dequeue := q.data[q.front];
    q.front := q.front + 1;
  end;
end;

procedure DisplayQueue(var q: Queue);
var
  i: integer;
begin
  if IsEmpty(q) then
    writeln('Очередь пуста.')
  else
  begin
    writeln('Элементы в очереди:');
    for i := q.front to q.rear do
      write(q.data[i], ' ');
    writeln;
  end;
end;

var
  choice, value: integer;

begin
  InitializeQueue(q);

  repeat
    writeln('Меню:');
    writeln('1. Добавить элемент в очередь (Enqueue)');
    writeln('2. Удалить элемент из очереди (Dequeue)');
    writeln('3. Показать элементы очереди');
    writeln('4. Выход');
    writeln('Выберите опцию (1-4): ');
    readln(choice);

    case choice of
      1: begin
           writeln('Введите значение для добавления в очередь:');
           readln(value);
           Enqueue(q, value);
         end;
      2: begin
           value := Dequeue(q);
           if value <> -1 then
             writeln('Удаленный элемент: ', value);
         end;
      3: DisplayQueue(q);
    end;
  until choice = 4;
end.