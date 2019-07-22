import re
import pandas as pd

# reads the model.ins file to get the obs names, formart, and -1 for vals in a data frame
def get_modelin(fn):
    d = {} # dictionary containing the obs name and the boundaries in the line
    with open(fn) as f:
        next(f) # skip the first line because it's not necessary for this action
        for line in f:
            (key, val) = re.sub('(^.*\[)|( .*$\n)','', line).split(']') # mung the line and retirn ons name and boundaries
            d[key] = val
    df = pd.DataFrame(d.items(), columns=('Name','cols')) # make data frame from dictionary
    df['vals'] = -1.0 # add col for vals with defaults of -1.0
    return(df)

junk = pd.DataFrame.from_dict(d, orient='index')
list(junk)
junk = pd.DataFrame(d.items(), columns=('Name','cols'))
junk['vals'] = -1
junk.head()
junk = get_modelin('./qual2kw_files/model.ins')
junk.tail()