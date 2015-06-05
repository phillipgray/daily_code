from __future__ import division


upper_limit = 999
lower_bound = 100


def is_palindrome(string):
    if string == string[::-1]:
        return True
    else:
        return False


def has_whole_factors(number):
    for divisor in range(upper_limit, lower_bound, -1):
        other_factor = number / divisor
        if other_factor.is_integer() and other_factor < 1000:
            return divisor, other_factor
            break
    return 0, 0

for x in range(upper_limit ** 2, lower_bound ** 2, -1):
    num1, num2 = has_whole_factors(x)
    if is_palindrome(str(x)) and num1 != 0:
        print "found it: {} * {} = {}, largest palindrome".format(num2, num1, x)
        break
