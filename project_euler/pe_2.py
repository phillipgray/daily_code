from datetime import datetime
startTime = datetime.now()
# three element list, previous two numbers in fib sequence and their sum as third
focus_group = [1, 2]
total = 2
while focus_group[1] < 4000000:
    focus_group.append(focus_group[0] + focus_group[1])
    if focus_group[2] % 2 == 0:
        total += focus_group[2]
    focus_group.pop(0)
print total

print "It took " + str(datetime.now() - startTime)
