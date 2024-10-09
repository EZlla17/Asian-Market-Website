# Project 3, Milestone 2: **Administrator** Design Journey

[← Table of Contents](../design-journey.md)


## Milestone 1 Feedback Revisions
> Explain what you revised in response to the Milestone 1 feedback (1-2 sentences)
> If you didn't make any revisions, explain why.

Did not make any revisions since I got full marks for milestone1.


## Edit Page URL
> Design the URL for the administrator's edit page.
> What is the URL for the administrator's edit page?

/admin
this url takes you to the admin view all page, clicking the grid will take you to the detailed page of the specific product. The format of the detail page would be: /admin/edit?id=$id.

> What query string parameters will you include in the URL?

| Query String Parameter Name       | Description       |
| --------------------------------- | ----------------- |
| id                                | the id of the product |



## SQL Query Plan
> Plan the SQL query to retrieve a record from one of your query string parameters.

```
use the $_GET method to get the id of the query string parameters
SELECT * FROM entry WHERE id = :id;",array(':id' => $id) to retrieve the record of the product with the id.
```

> Plan the SQL query to retrieve all tag names for a specific record.

```
SELECT tags.name FROM tags
INNER JOIN entry_tags ON tags.id=entry_tags.tags_id
INNER JOIN entry ON entry_tags.entry_id = entry.id
WHERE entry_tags.entry_id = $id
```


## Contributors

I affirm that I am submitting my work for the administrator requirements in this milestone.

Admin Lead: Xinyi Zhou


[← Table of Contents](../design-journey.md)
