from math import sqrt


def is_prime(x):
    x = int(x)
    if x <= 1:
        return False
    elif x == 2:
        return True
    else:
        for n in range(2, x):
            if x % n == 0:
                return False
        return True

big_number = 600851475143
bound = int(sqrt(big_number))

for i in range(bound, 0, -1):
    if big_number % i == 0:
        if is_prime(i):
            print "The prime is {}".format(i)
            break
