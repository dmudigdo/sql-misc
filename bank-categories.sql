/*
    This must be the simplest practical use case for SQL.

    My wife Juliet asked me to find out how much we spent
    on Coles and Woolworths supermarkets in the last 6 months.
    Using DB Browser (SQLite database browser), this was very
    easily done: ready-to-go environment, few lines of code.

    This assumes that the bank transaction exported .csv table
    has the headings 'Date', 'Description' and 'Debit' in there,
    please adjust as necessary.
*/

SELECT Date, Description, Debit
FROM transactions
WHERE (
       lower(Description) LIKE '%coles%'
    OR lower(Description) LIKE '%woolworths%'
    ) AND Debit IS NOT NULL
	
/*
    Other categories:

       lower(Description) LIKE '%coles%'
    OR lower(Description) LIKE '%woolworths%'
    OR lower(Description) LIKE '%aldi %'
    OR lower(Description) LIKE '%kmart%'
    OR lower(Description) LIKE '%wholefoods%'
    OR lower(Description) LIKE '%source%'
    OR lower(Description) LIKE '%great earth%'
*/
