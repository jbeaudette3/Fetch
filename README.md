# Hello!
---
&nbsp;

Please see attached files for my initial insight into these datasets.

To start and follow along, I imported the below libraries:

    import matplotlib.pyplot as plt
    from datetime import datetime
    import seaborn as sns
    import pandas as pd
    import numpy as np
    import json

Files arrived as json.gz. Extracting data had some issues, so the below commands were used in the command line:  

    gzip -dk receipts.json.gz  
    gzip -dk brands.json.gz  
    gzip -dk users.json.gz  

Files were turned from unstructured json files into structured pandas dataframes.
In /python-clean/:

    users-clean.py
    brands-clean.py
    receipts-clean.py   // this produces 2 files, one for the receipt, and one where each row is an item on the receipt.
    
After creating a database with `CREATE DATABASE Fetch;`, tables were inserted into SQL.
In /SQL-load/:

    SQL-load-users.sql
    SQL-load-brands.sql
    SQL-load-receipts.sql
    SQL-load-receipt_items.sql
    
 Initial query: Average Spend vs Total Items Purchased where rewards points were accepted vs rejected:
 
     SQL-Query-AvgSpend_vs_TotalItemsPurchased.sql
