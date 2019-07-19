def tsagg(df, wq_par):
    df['Hour'] = df['Time'].astype(int)
    df['Hour'] = df['Hour'].astype(str)
    df['Hour'] = df['Hour'].astype(int)
    agg_funcs = dict(Min='min', Ave='mean', Max='max')
    df_agg = df.groupby(['Reach', 'Hour'])[wq_par].agg(agg_funcs)
    df_agg.reset_index(inplace=True)
    return df_agg

