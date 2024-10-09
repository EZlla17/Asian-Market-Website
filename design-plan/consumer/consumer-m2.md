# Project 3, Milestone 2: **Consumer** Design Journey

[← Table of Contents](../design-journey.md)


## Milestone 1 Feedback Revisions
> Explain what you revised in response to the Milestone 1 feedback (1-2 sentences)
> If you didn't make any revisions, explain why.

No revision, got full points in milestone 1.


## Details Page URL
> Design the URL for the consumer's detail page.
> What is the URL for the detail page?

/
this url takes you to the consumer home page, clicking the grid will take you to the detailed page of the specific product. The format of the detail page would be: /detail?id=$id.

> What query string parameters will you include in the URL?

| Query String Parameter Name       | Description       |
| --------------------------------- | ----------------- |
| id | the id of the specific product |
|                                   |                   |
|                                   |                   |


## SQL Query Plan
> Plan the SQL query to retrieve a record from one of your query string parameters.

```
1. Use the get method to retrive id from the query string parameter.
2. SELECT * FROM entry WHERE id=:id
```

> Plan the SQL query to retrieve all tag names for a specific record.

```
SELECT tags.name FROM tags
INNER JOIN entry_tags ON tags.id=entry_tags.tags_id
INNER JOIN entry ON entry_tags.entry_id = entry.id
WHERE entry_tags.entry_id = $id
```


## Contributors

I affirm that I am submitting my work for the consumer requirements in this milestone.

Consumer Lead: Penny Ren


[← Table of Contents](../design-journey.md)
