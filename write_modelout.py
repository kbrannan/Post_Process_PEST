import re

line = 'l1 [Flow05]14:29'

re.sub('^.*\[','', line).split(']')
f = './qual2kw_files/model.ins'

d = get_modelin(f)
d
def get_modelin(fn):
    d = {}
    with open(fn) as f:
        next(f) # skip the first line because it's not necessary for this action
        for line in f:
            (key, val) = re.sub('(^.*\[)|( .*$\n)','', line).split(']') # mung the line and retirn ons name and boundaries
            d[key] = val
    return(d)

