# Hello!
---
&nbsp;

Please see attached files for my initial insight into these datasets.

To start and follow along, I recommend running the python files to clean the datasets in the way I used.
I tried to keep my library usage fairly small:

    import matplotlib.pyplot as plt
    from datetime import datetime
    import seaborn as sns
    import pandas as pd
    import numpy as np
    import json
    
I did my insight using python's pandas dataframes, along with SQL queries.

Recommendation on running files:
- Files arrived as json.gz. Extracting data had some issues, so the below commands were used in the command line:
    >>> gzip -dk receipts.json.gz
    >>> gzip -dk brands.json.gz
    >>> gzip -dk users.json.gz
