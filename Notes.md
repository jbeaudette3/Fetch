# Hello!
---
&nbsp;

In doing some initial perusing through the data, I found some curiosities and had questions:

- Is there an API I should be aware of for easier connectivity?

<u>Reciepts Table</u>
- What are the +/- 430 test brands listed in the most recent recipets? Is this something I should be aware of for the future and/or be keeping an eye on how these brands perform?
- Barcode: Item 4011 - Item not found. What is this product?
- Not every barcode has a description.
- - is every barcode a product or can they also be a rewards group?
- what is 'originalMetaBrite'?

<u>Performance and Scaling</u>
- reciepts item list should probably be it's own table, and have a unique ID to link back to rewards table.
- While I only see 7 unique reasons for bonusPointsEarnedReason, however this can be separated out into its own table as well. Having a separate table will allow reasons to be added easily for promotions (Holidays, seasonal sales, etc.), instead of having to update the full table of existing reciepts and adding more data, replace with "reason 6".

<u>Data Quality Issues</u>
- Please see photos attached and notes below (users null values, receipts null values, and brands null values).
- The white lines indicate null values from each table.  
&nbsp;  

Users
- where did people sign up from?
- why no state?
- if every value in lastLogin is null, why is the column necessary at all?

Brands
- Why are so many items left with no categories?

Receipts
- It appears totalSpent is only kept track when points are earned. Can total spend be kept track whether or not points are earned? Can partnerships be started with companies of products that people are buying, but not getting points for?
