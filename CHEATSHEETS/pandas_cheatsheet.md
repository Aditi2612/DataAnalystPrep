# Pandas Cheatsheet

## Loading data
```python
pd.read_csv("file.csv")
pd.read_excel("file.xlsx")
pd.read_excel("file.xlsx", header=5)   # when the header isn't row 0
```

## Looking at data
```python
df.head()             # first 5 rows of the dataset
df.shape              # rows and columns count (2 numbers)
df.info()             # column names, datatypes, non-null counts — summary of the DataFrame
df.columns            # names of the columns
df.nunique()          # count of unique values in each column
df['col'].unique()    # the actual unique values in one column
```

## Finding problems
```python
df.isnull().sum()     # counts missing values per column
```

## Cleaning
```python
df.dropna(subset=['col'])       # drops entire ROWS where that column is null
df.dropna(axis=1, how='all')    # drops COLUMNS that are entirely empty
df['col'].replace('old','new')  # replaces old values with new in that column
```
**axis:** `0` = rows · `1` = columns
**how:** `'any'` = drop if at least one value is null · `'all'` = drop only if every value is null

## Combining
```python
pd.concat([df1, df2], ignore_index=True)   # stacks DataFrames, renumbers rows
```

## Saving
```python
df.to_csv("out.csv", index=False)   # saves as CSV — avoids re-running slow loads
```
