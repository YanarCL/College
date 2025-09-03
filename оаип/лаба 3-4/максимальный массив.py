k=int(input())
for i in range(k):
    l,r=map(int,input().split())
    dlina=0
    while l+dlina<=r:
        l=l+dlina
        dlina=dlina+1
    print(i)