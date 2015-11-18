from urllib import urlopen


def follow_the_links(key=12345):
    url = "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing={}".format(key)
    page = urlopen(url).read()
    try:
        print page
        new_key = int(page[-5:])
        follow_the_links(new_key)
    except ValueError:
        print page

follow_the_links(2284)
