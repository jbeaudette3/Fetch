file_path = '/data/receipts.json'

recpts = [json.loads(line) for line in open(file_path, 'r')]
recpts = json.dumps(recpts)

recpts = pd.json_normalize(json.loads(recpts))

recpts = recpts.where(pd.notnull(recpts), None)

recpts['createDate.$date2'] = pd.to_datetime(recpts['createDate.$date'], unit = 'ms')
recpts['dateScanned.$date2'] = pd.to_datetime(recpts['dateScanned.$date'], unit = 'ms')
recpts['finishedDate.$date2'] = pd.to_datetime(recpts['finishedDate.$date'], unit = 'ms')
recpts['modifyDate.$date2'] = pd.to_datetime(recpts['modifyDate.$date'], unit = 'ms')
recpts['pointsAwardedDate.$date2'] = pd.to_datetime(recpts['pointsAwardedDate.$date'], unit = 'ms')
recpts['purchaseDate.$date2'] = pd.to_datetime(recpts['purchaseDate.$date'], unit = 'ms')


# manually flatten the list, cuz idk how better to do this
# turn rewardsReceiptItemList into its own table
# make list of all unique keys in column

recptItems = []

rlist = recpts['rewardsReceiptItemList']

# how many receipts are there
for i in range(len(rlist)):
  r = rlist.iloc[i]

  # if there is a receipt
  if (r != None):

    # how many items are on each receipt
    r_length = len(r)

    for j in range(r_length):
      for key, _ in r[j].items():       # get only Key. Value isn't important right now
        if(key not in recptItems):      # if Key isn't in list, add it.

          # append key to list
          # if there's a lot of keys, change list to set
          # for faster speed, right?
          recptItems.append(key)

# create new dataframe
# use newly created list as column headers
# 2021.09.25 - currently 35 columns

# blank it out first, just in case (debugging probs)
# df_recpt = pd.DataFrame()
df_recpt = pd.DataFrame(columns = recptItems)

# takes like 30 seconds to run
# goes through each receipt item
# fills values into a dataframe
for i in range(len(rlist)):
  r = rlist.iloc[i]

  # if there is a receipt
  if (r != None):

    # how many items are on each receipt
    r_length = len(r)

    for j in range(r_length):

      # declare receipt-item number
      recpt_item = f'{recpts.iloc[i]["_id.$oid"]}-{j}'

      for key, value in r[j].items():
        # syntax below
        # pd.at[row, column] = value

        # row/index/primary key = recpt_item
        # column = key
        # value = value

        # test print below for debugging
        # print(f'{_id}\t{key}\t\t{value}')
        df_recpt.at[recpt_item, key] = value


df_recpt.index.name = 'recpt_item'
df_recpt = df_recpt.reset_index()

# split recpt_item into _id and item_no
_id = []
item_no = []

for x, y in df_recpt['recpt_item'].str.split('-'):
  _id.append(x)
  item_no.append(y)

df_recpt.insert(1, '_id.$oid', _id)
df_recpt.insert(2, 'item_no', item_no)

# drop list column from original recpt dataframe
recpts = recpts.drop('rewardsReceiptItemList', axis = 1)

# save each as tab-separated values
recpts.to_csv('/data/cleaned_receipts.tsv', sep='\t', index = False)
df_recpt.to_csv('/data/cleaned_receipt_items.tsv', sep='\t', index = False)
