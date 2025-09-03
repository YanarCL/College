t = int(input())
b = []
for i in range(t):
    a = int(input())
    b.append(a)
for j in range(t):
    print((b[j]//10)+(b[j]%10))