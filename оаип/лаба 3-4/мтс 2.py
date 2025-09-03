def string(s) :
    target = "MTS"
    target_index = 0
    for char in s:
        if char == target[target_index]:
            target_index += 1
        if target_index == len (target) :
            return 1
    return 0
s = input ().strip()
print (string (s))

