x = 0
y = 0
q = input('Введите клетку шахматной доски: ')

if len(q) == 2:
    if q[0] in 'abcdefgh':
        x = ord(q[0])
    if q[1] in '12345678':
        y = ord(q[1])

if x == 0 or y == 0:
    print('Не правильно!')
elif (x + y) % 2 == 0:
    print('black')
else:
    print('white')
