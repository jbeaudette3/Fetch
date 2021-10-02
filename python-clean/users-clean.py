# load data
df = pd.DataFrame(pd.read_json('/content/drive/MyDrive/Fetch Interview/users.json',\
                               lines = True))

# normalize
flat_users = pd.json_normalize(json.loads(df.to_json(orient='records')))

# nulls
flat_users = flat_users.where(pd.notnull(flat_users), None)

# convert unix milliseconds to human readable dates
flat_users['createdDate2.$date'] = pd.to_datetime(flat_users['createdDate.$date'], unit = 'ms')
flat_users['lastLogin2.$date'] = pd.to_datetime(flat_users['lastLogin.$date'], unit = 'ms')

# drop null column
flat_users = flat_users.drop('lastLogin', axis = 1)

# save as tab-separated values
flat_users.to_csv('/content/drive/MyDrive/Fetch Interview/cleaned_users.tsv',\
                  sep='\t',\
                  index = False)
