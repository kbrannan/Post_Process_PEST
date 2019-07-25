# add location of library Postprocess_for PEST to system path
import sys
sys.path.insert(0, 'C:/Users/kbranna/local_repos/qual2kw_output/pest')
#import Postprocess_for_PEST as pfp
import Postprocess_for_PEST as pfp

# local variables
str_path_out = './qual2kw_files'
str_file_q2k = 'UY_do.out'
str_file_ins = 'model.ins'
str_file_out = 'model.out'

# get model output info from model.ins file
df_ins = pfp.get_modelin(str_path_out + '/' + str_file_ins)

## get file and information for the QUAL2kw output
content = pfp.getoutfile(str_path_out + '/' + str_file_q2k) # need to get rid of '\n' form end of lines
index = pfp.getrows(content)
str_table_names = pfp.gettablenames(content, index)
dict_tables = pfp.makedicttable(str_table_names, index, len(content))

## get output data for PEST
## Obs group flow
str_table_name = 'Hydraulics Summary'
## create the data frame for the QUAL2kw for flow output table
df_flow = pfp.makedf(content, str_table_name, dict_tables)
## reach info, this table uses downstream dtance, not reach number
## flow05 flow for Reach 5
## Reach 5, downstream distanc is 16.2
df_ins.loc[df_ins['Name'] == 'Flow05', 'vals'] = df_flow.loc[df_flow['Downstream distance'] == 16.2, 'Flow'].iat[0]
## flow08 flow for Reach 8
## Reach 8, downstream distanc is 0
df_ins.loc[df_ins['Name'] == 'Flow08', 'vals'] = df_flow.loc[df_flow['Downstream distance'] == 0, 'Flow'].iat[0]

## obs group fcob
str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
df_dawq1 = pfp.makedf(content, str_table_name, dict_tables)
df_ins.loc[df_ins['Name'] == 'fcob08', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 8, 'Fast CBOD'].iat[0]
df_ins.loc[df_ins['Name'] == 'fcob06', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 6, 'Fast CBOD'].iat[0]
df_ins.loc[df_ins['Name'] == 'fcob05', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 5, 'Fast CBOD'].iat[0]

## obs group orgn
##str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
##df_dawq1 = mdf.makedf(content, str_table_name, dict_tables)
df_ins.loc[df_ins['Name'] == 'orgn08', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 8, 'Organic N'].iat[0]
df_ins.loc[df_ins['Name'] == 'orgn06', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 6, 'Organic N'].iat[0]
df_ins.loc[df_ins['Name'] == 'orgn05', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 5, 'Organic N'].iat[0]

## obs group nh4
##str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
##df_dawq1 = mdf.makedf(content, str_table_name, dict_tables)
df_ins.loc[df_ins['Name'] == 'nh408', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 8, 'NH4-N'].iat[0]
df_ins.loc[df_ins['Name'] == 'nh406', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 6, 'NH4-N'].iat[0]
df_ins.loc[df_ins['Name'] == 'nh405', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 5, 'NH4-N'].iat[0]

## obs group no3
##str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
##df_dawq1 = mdf.makedf(content, str_table_name, dict_tables)
df_ins.loc[df_ins['Name'] == 'no308', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 8, 'NO3+NO2-N'].iat[0]
df_ins.loc[df_ins['Name'] == 'no306', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 6, 'NO3+NO2-N'].iat[0]
df_ins.loc[df_ins['Name'] == 'no305', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 5, 'NO3+NO2-N'].iat[0]

## obs group orgp
##str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
##df_dawq1 = mdf.makedf(content, str_table_name, dict_tables)
df_ins.loc[df_ins['Name'] == 'orgp08', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 8, 'Organic P'].iat[0]
df_ins.loc[df_ins['Name'] == 'orgp06', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 6, 'Organic P'].iat[0]
df_ins.loc[df_ins['Name'] == 'orgp05', 'vals'] = df_dawq1.loc[df_dawq1['Reach'] == 5, 'Organic P'].iat[0]

## get the time-series data and aggregate on hour for min, ave, and max
str_table_name = 'Diel water quality in the main channel (part 1 of 2)'
reaches = (5, 6, 8) # get output for these reaches
df_tswq1 = pfp.makedf(content, str_table_name, dict_tables)
df_tswq1 = df_tswq1.loc[df_tswq1['Reach'].isin(reaches)] # subset rows for data from reaches
df_tswq1['Hour'] = df_tswq1['Time'].astype(int) # create a new column that has the hour only of the time
df_tswq1['Hour'] = df_tswq1['Hour'].astype(str)
df_tswq1['Hour'] = df_tswq1['Hour'].astype(int)
## populate the hourly obs values for the DO time-series
df_agg = pfp.tsagg(df_tswq1, 'Dissolved Oygen')
par = 'doave' # average
sub = list(df_ins.loc[df_ins['Name'].str.contains(par), 'Name'])
for cur in sub:
    df_ins.loc[df_ins['Name'] == cur, 'vals'] = pfp.get_value(cur, df_agg)
par = 'domin' # minimum
sub = list(df_ins.loc[df_ins['Name'].str.contains(par), 'Name'])
for cur in sub:
    df_ins.loc[df_ins['Name'] == cur, 'vals'] = pfp.get_value(cur, df_agg)
par = 'domax' # maximum
sub = list(df_ins.loc[df_ins['Name'].str.contains(par), 'Name'])
for cur in sub:
    df_ins.loc[df_ins['Name'] == cur, 'vals'] = pfp.get_value(cur, df_agg)

## populate the hourly obs values for the Temperature time-series
df_agg = pfp.tsagg(df_tswq1, 'Water temperature')
par = 'tempave' # average
sub = list(df_ins.loc[df_ins['Name'].str.contains(par), 'Name'])
sub[14][-7:-4]
int(sub[14][-2:])
int(sub[14][-4:-2])
pfp.get_value(sub[14], df_agg)
for cur in sub:
    df_ins.loc[df_ins['Name'] == cur, 'vals'] = pfp.get_value(cur, df_agg)

par = 'tempmin' # minimum
sub = list(df_ins.loc[df_ins['Name'].str.contains(par), 'Name'])
for cur in sub:
    df_ins.loc[df_ins['Name'] == cur, 'vals'] = pfp.get_value(cur, df_agg)
par = 'tempmax' # maximum
sub = list(df_ins.loc[df_ins['Name'].str.contains(par), 'Name'])
for cur in sub:
    df_ins.loc[df_ins['Name'] == cur, 'vals'] = pfp.get_value(cur, df_agg)

## populate the hourly obs values for the pH time-series
df_agg = pfp.tsagg(df_tswq1, 'pH')
par = 'pHave' # average
sub = list(df_ins.loc[df_ins['Name'].str.contains(par), 'Name'])
for cur in sub:
    df_ins.loc[df_ins['Name'] == cur, 'vals'] = pfp.get_value(cur, df_agg)
par = 'pHmin' # minimum
sub = list(df_ins.loc[df_ins['Name'].str.contains(par), 'Name'])
for cur in sub:
    df_ins.loc[df_ins['Name'] == cur, 'vals'] = pfp.get_value(cur, df_agg)
par = 'pHmax' # maximum
sub = list(df_ins.loc[df_ins['Name'].str.contains(par), 'Name'])
for cur in sub:
    df_ins.loc[df_ins['Name'] == cur, 'vals'] = pfp.get_value(cur, df_agg)

## Write df_ins to model.out file
f = open(str_path_out + '/' + str_file_out, 'w')
for index, row in df_ins.iterrows():
    f.write(pfp.create_ln(row) + '\n')
f.close()
