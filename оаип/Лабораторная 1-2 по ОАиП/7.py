t = int(input())
results = []
for v in range(t):
    a, b = map(int, input().split())
    min = b - a
    results.append(min)
for result in results:
    print(result)