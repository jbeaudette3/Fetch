d = dict()

for i in range(len(recpts)):
  # get each item in list
  recpt = recpts['rewardsReceiptItemList'].iloc[i]

  # if there was a purchase:
  if(type(recpt) != type(None)):

    # get each item in reciept
    for j in range(len(recpt)):
      for key, value in recpt[j].items():

        # look for 'rewardsGroup' key in dictionary
        if(key == 'rewardsGroup'):

          # count each item, add if not already existing
          if(value in d):
            d[value] = d[value] + 1
          else:
            d[value] = 1

# turn dictionary into sortable dataframe
df = pd.DataFrame.from_dict(data = d.items())

# rename columns
df = df.rename(columns = {0: 'name', 1:'count'})

# sort values
df.sort_values(by='count', ascending = False).head(10)
