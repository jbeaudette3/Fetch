# load data
file_path = '/data/receipts.json'

# string comprehension into new list
recpts = [json.loads(line) for line in open(file_path, 'r')]
recpts = json.dumps(recpts)

# normalize
recpts = pd.json_normalize(json.loads(recpts))

# nulls
recpts = recpts.where(pd.notnull(recpts), None)

# convert millisecond unix timestamp to human-readable time
recpts['createDate.$date2'] = pd.to_datetime(recpts['createDate.$date'], unit = 'ms')
recpts['dateScanned.$date2'] = pd.to_datetime(recpts['dateScanned.$date'], unit = 'ms')
recpts['finishedDate.$date2'] = pd.to_datetime(recpts['finishedDate.$date'], unit = 'ms')
recpts['modifyDate.$date2'] = pd.to_datetime(recpts['modifyDate.$date'], unit = 'ms')
recpts['pointsAwardedDate.$date2'] = pd.to_datetime(recpts['pointsAwardedDate.$date'], unit = 'ms')
recpts['purchaseDate.$date2'] = pd.to_datetime(recpts['purchaseDate.$date'], unit = 'ms')

# save dataset
recpts.to_csv('/data/cleaned_receipts.csv')
