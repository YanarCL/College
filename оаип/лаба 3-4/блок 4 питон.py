n = int(input("Введите количество предприятий: "))
numbers = []
powers = []
for i in range(n):
    number = int(input(f"Введите порядковый номер предприятия {i+1}: "))
    power = float(input(f"Введите энергетическую мощность предприятия {i+1}: "))
    numbers.append(number)
    powers.append(power)
total_power = sum(powers)
average_power = total_power / n
max_power = powers.index(max(powers))
max_power_number = numbers[max_power]
print(f"Общая мощность по отрасли: {total_power:.2f}")
print(f"Средняя мощность по отрасли: {average_power:.2f}")
print(f"Порядковый номер предприятия с наибольшей мощностью: {max_power_number}")
