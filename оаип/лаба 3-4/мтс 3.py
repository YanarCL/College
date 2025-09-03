def s (n,c):
    c=sum(c)
    if c%2==0:
        return 1
    else:
        return 0
n= int(input().strip())
c= [int(input().strip())for i in range (n)]
result = s(n,c)
print(result)