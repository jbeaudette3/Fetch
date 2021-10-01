# load data
df_brands = pd.DataFrame(pd.read_json('/data/brands.json', lines = True))

# normalize
brands = pd.json_normalize(json.loads(df_brands.to_json(orient = 'records')))

# nulls
brands = brands.where(pd.notnull(brands), None)

# save cleaned dataset
brands.to_csv('/data/cleaned_brands.csv', index = False)
