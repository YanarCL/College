A1, A2, A3, A4 = map(float, input('Введите координаты точек отрезков (A1, A2, A3, A4): ').split())
c1 = 0
c2 = 0
c3 = 0
Points = int(input('Введите количество точек: '))
i = 1
while True:
    point = float(input(f'Введите координату точки {i}: '))
    i += 1
    if A1 <= point <= A2:
        c1 += 1
    elif A2 < point <= A3:
        c2 += 1
    elif A3 < point <= A4:
        c3 += 1
    if i>Points:
        break
print('Количество точек в отрезке A1-A2:', c1)
print('Количество точек в отрезке A2-A3:', c2)
print('Количество точек в отрезке A3-A4:', c3)

