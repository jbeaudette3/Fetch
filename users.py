# load data
df = pd.DataFrame(pd.read_json('/data/users.json', lines = True))

# normalize
users = pd.json_normalize(json.loads(df.to_json(orient='records')))

# nulls
users = users.where(pd.notnull(users), None)

# convert unix milliseconds to human readable dates
flat_users['createdDate2.$date'] = pd.to_datetime(users['createdDate.$date'], unit = 'ms')
flat_users['lastLogin2.$date'] = pd.to_datetime(users['lastLogin.$date'], unit = 'ms')

# save new dataset
users.to_csv('/data/cleaned_users.csv')
