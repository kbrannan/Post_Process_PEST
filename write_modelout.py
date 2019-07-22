import re

# reads the model.ins file to get the obs names and formart in a disctionary
def get_modelin(fn):
    d = {} # dictionary containing the obs name and the boundaries in the line
    with open(fn) as f:
        next(f) # skip the first line because it's not necessary for this action
        for line in f:
            (key, val) = re.sub('(^.*\[)|( .*$\n)','', line).split(']') # mung the line and retirn ons name and boundaries
            d[key] = val
    return(d)

