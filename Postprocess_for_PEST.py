import math, re, pandas as pd

# takes float and returs a string in fortran 24.16E+00 notation
def f_format(x):
    if x > 0:
        myexp = 10**math.ceil(math.log10(x))
        x_str = '{0:>20.16f}E+{1:02}'.format(x/ myexp, int(math.log10(myexp)))
    if x == 0:
        x_str = '  0.0000000000000000E+00'
    if x < 0:
        x = abs(x)
        myexp = 10**math.ceil(math.log10(x))
        x_str = '{0:>20.16f}E+{1:02}'.format(-1*x/ myexp, int(math.log10(myexp)))
    return x_str

# make string in format of a row from the Hydraulics Summary
def l_hydsum(r):
    l = ''.join([f_format(x) for x in r])
    return l

# read output file and return contents
# as a string list with rows the lines of the output files
def getoutfile(str_file):
    with open(str_file) as f:
        #str_out = f.readlines()
        str_out = f.read().splitlines()
    #str_out = [re.sub('\\n$', '', x) for x in str_out]
    return str_out

# gets the rows in the file that are the readers for the output tables
def getrows(str_out):
    row_index = [x for x in range(len(str_out)) if '**' in str_out[x]]
    zip(row_index[:-1], [row_index[1:], len(str_out)])
    return row_index

# given the rows of table headers and the content of the out file
# returns the names of the tables
def gettablenames(str_out, rows):
    ts = [str_out[x] for x in rows]
    tx = [re.sub('^( ){1,}|( ){1,}$','',re.sub('(\\n){1,}','', re.sub('(\*){1,}','', x))) for x in ts]
    return tx

## extracts table from output and returns pandas data frame
# function that breaks string int a list of chunk for a specific width
def chunkstring(string, length):
    return [string[0+i:length+i] for i in range(0, len(string), length)]

# gets the column names from the output table
def getheader(str_out, str_tab, dict_info):
    rs = dict_info.get(str_tab)
    str_raw = str_out[rs[0]]
    str_list = chunkstring(str_raw, 24)
    header = [re.sub('^( ){1,}|( ){1,}$', '', x) for x in str_list]
    return header

# get the units
def getunits(str_out, str_tab, dict_info):
    rs = dict_info.get(str_tab)
    str_raw = str_out[rs[0] + 1] # units are the line below the column names
    str_list = chunkstring(str_raw, 24)
    str_units = [re.sub('^( ){1,}|( ){1,}$', '', x) for x in str_list]
    return str_units

# get the values from the output table
def extraxtvals(str_out, str_tab, dict_info):
    rs = dict_info.get(str_tab)
    r = 2 # row the values start at in table
    if 'Diel' in str_tab:
        r = 3 # there is an extra row above values for diel tables
    str_sub = str_out[(rs[0]+r):rs[1]]
    data_blk = makeblk(str_sub)
    return data_blk

# takes row from output tables values and parses into list using
# fixed length of columns
# used in makeblk function
def get_row_fix(r, length):
    row_raw = chunkstring(r, length)
    rout =  [re.sub('^( ){1,}|( ){1,}$','',x) for x in row_raw]
    return rout

# makes a data block of values from output table
def makeblk(str_vals):
    data_blk = [get_row_fix(str_vals[x], 24) for x in range(len(str_vals))]
    return data_blk

# makes a pandas data frame from a table in output
def makedf(str_out, str_tab, dict_info):
    col_names = getheader(str_out, str_tab, dict_info)
    units = getunits(str_out, str_tab, dict_info)
    data_blk =  extraxtvals(str_out, str_tab, dict_info)
    df_raw = pd.DataFrame.from_records(data_blk,columns = col_names)
    df = df_raw.apply(pd.to_numeric, errors = 'ignore')
    return df

# creates a dictionary fo table names as kets and the starting and
# ending rows of each table
def makedicttable(tab_names, tab_rows, n_rows):
    tab_str = [x + 1 for x in tab_rows]
    tab_end = [x - 1 for x in tab_rows[1:]]
    tab_end.append(n_rows)
    dic_tab_names = dict(zip(tab_names, zip(tab_str, tab_end)))
    return dic_tab_names

# aggregates time-series by the hour using min, mean, and max functions
def tsagg(df, wq_par):
    df['Hour'] = df['Time'].astype(int)
    df['Hour'] = df['Hour'].astype(str)
    df['Hour'] = df['Hour'].astype(int)
    agg_funcs = dict(Min='min', Ave='mean', Max='max')
    df_agg = df.groupby(['Reach', 'Hour'])[wq_par].agg(agg_funcs)
    df_agg.reset_index(inplace=True)
    return df_agg

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
    df['cols'] = df['cols'].str.strip() # get rid of any whitespaces that could have snuck in
    return(df)

## gets value from aggregated dataframe for the reach, hour, and stat of the cur obs name from df_ins
def get_value(cur, df_agg):
    val = float(df_agg[(df_agg['Reach'] == int(cur[-4:-2])) & (df_agg['Hour'] == int(cur[-2:]))][cur[-7:-4].title()])
    return(val)

# prints number in E to width defined by column boundaries
def print_num(cols, num):
    out = '{:+.{prec}E}'.format(num, prec=cols[1] - cols[0] - 7)
    return(out)

