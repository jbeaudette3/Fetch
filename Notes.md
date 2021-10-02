# Hello!
---
&nbsp;

In doing some initial perusing through the data, I found some curiosities, questions, and recommendations for improvement:

- Is there an API I should be aware of for easier connectivity?

<u>Reciepts Table</u>
- What are the +/- 430 test brands listed in the most recent recipets? Is this something I should be aware of for the future and/or be keeping an eye on how these brands perform?
- Not every barcode has a description.
- - is every barcode a product or can they also be a rewards group?
- what is 'originalMetaBrite'?
- It appears totalSpent is only kept track when points are earned. Can total spend be kept track whether or not points are earned? Can partnerships be started with companies of products that people are buying, but not getting points for?

<u>Users Table</u>
- where did people sign up from?
- why no state?
- if every value in lastLogin is null, why is the column necessary at all?

<u>Brands</u>
- Why are so many items left with no categories?

---

<u>Performance and Scaling</u>
- reciepts item list should probably be it's own table, and have a unique ID to link back to rewards table.
- While I only see 7 unique reasons for bonusPointsEarnedReason, however this can be separated out into its own table as well. Having a separate table will allow reasons to be added easily for promotions (Holidays, seasonal sales, etc.), instead of having to update the full table of existing reciepts and adding more data, replace with "reason 6".

<u>Data Quality Issues</u>
- Please see photos attached to the python-analysis folder.
- The white lines indicate null values from each table
- - Recommend to list every brand as a code so performance can be tracked
- - Recommend to have user's state included. Are users in certain states using the rewards points service more than other states? Can you improve advertising in the lower-usage states?

---

That's all the notes I have at this time. If you have any questions or concerns, please feel free to let me know!
Best,
Jeff Beaudette
