import string

coded_text = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."

alpha = string.ascii_lowercase
translation_dictionary = {}

for index, char in enumerate(alpha):
    if char == 'y':
        translation_dictionary[char] = 'a'
        break
    elif char == 'z':
        translation_dictionary[char] = 'b'
        break
    else:
        translation_dictionary[char] = alpha[index + 2]

# print translation_dictionary.items()

new_string = ""
for char in coded_text:
    if char in translation_dictionary:
        new_string += translation_dictionary[char]
    else:
        new_string += char

print new_string

new_alpha = alpha[2:]
new_alpha += "ab"

translation_table = string.maketrans(alpha, new_alpha)
print coded_text.translate(translation_table)
