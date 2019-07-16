import Postprocess_for_PEST as pfp

# local variables
str_path_out = 'C:/Users/kbranna/local_repos/qual2kw_output/qual2kw_files'
str_file_q2k = 'UY_do.out'

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
flow05 = df_flow.loc[df_flow['Downstream distance'] == 16.2, 'Flow']
## flow08 flow for Reach 8
## Reach 8, downstream distanc is 0
flow08 = df_flow.loc[df_flow['Downstream distance'] == 0, 'Flow']

## obs group fcob
str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
df_dawq1 = pfp.makedf(content, str_table_name, dict_tables)
fcob08 = df_dawq1.loc[df_dawq1['Reach'] == 8, 'Fast CBOD']
fcob06 = df_dawq1.loc[df_dawq1['Reach'] == 6, 'Fast CBOD']
fcob05 = df_dawq1.loc[df_dawq1['Reach'] == 5, 'Fast CBOD']

## obs group orgn
##str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
##df_dawq1 = mdf.makedf(content, str_table_name, dict_tables)
orgn08 = df_dawq1.loc[df_dawq1['Reach'] == 8, 'Organic N']
orgn06 = df_dawq1.loc[df_dawq1['Reach'] == 6, 'Organic N']
orgn05 = df_dawq1.loc[df_dawq1['Reach'] == 5, 'Organic N']

## obs group nh4
##str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
##df_dawq1 = mdf.makedf(content, str_table_name, dict_tables)
nh408 = df_dawq1.loc[df_dawq1['Reach'] == 8, 'NH4-N']
nh406 = df_dawq1.loc[df_dawq1['Reach'] == 6, 'NH4-N']
nh405 = df_dawq1.loc[df_dawq1['Reach'] == 5, 'NH4-N']

## obs group no3
##str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
##df_dawq1 = mdf.makedf(content, str_table_name, dict_tables)
n0308 = df_dawq1.loc[df_dawq1['Reach'] == 8, 'NO3+NO2-N']
n0306 = df_dawq1.loc[df_dawq1['Reach'] == 6, 'NO3+NO2-N']
no305 = df_dawq1.loc[df_dawq1['Reach'] == 5, 'NO3+NO2-N']

## obs group orgp
##str_table_name = 'Daily average water quality summary for main channel (part 1 of 2)'
##df_dawq1 = mdf.makedf(content, str_table_name, dict_tables)
orgp08 = df_dawq1.loc[df_dawq1['Reach'] == 8, 'Organic P']
orgp06 = df_dawq1.loc[df_dawq1['Reach'] == 6, 'Organic P']
orgp05 = df_dawq1.loc[df_dawq1['Reach'] == 5, 'Organic P']

## obs group doave
str_table_name = 'Diel water quality in the main channel (part 1 of 2)'
df_dowq1 = pfp.makedf(content, str_table_name, dict_tables)
df_dowq1['Hour'] = df_dowq1['Time'].astype(int)
df_dowq1['Hour'] = df_dowq1['Hour'].astype(str)
list(df_dowq1)
df_dowq1.groupby(['Reach', 'Hour'])['Dissolved Oygen'].agg(('mean', 'min', 'max'))