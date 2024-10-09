# Project 3, Milestone 3: **Administrator** Design Journey

[← Table of Contents](../design-journey.md)


## Milestone 2 Feedback Revisions
> Explain what you individually revised in response to the Milestone 1 feedback (1-2 sentences)
> If you didn't make any revisions, explain why.

Add parameter markers to our second query which we get points off from the last milestone.


## Edit Form - UPDATE query
> Plan your query to update an entry in your catalog.

```sql
UPDATE entry SET name= :name, price = :price, rating = :rating, description = :description WHERE id = :id", array(
        ':id' => $form_values["id"],
        ':name' => $form_values["name"],
        ':price' => $form_values["pricing"],
        ':rating' => $form_values["rating"],
        ':description' => $form_values["description"])
```


## Edit Form - Sample Test Data
> Document sample test data to edit an entry in your catalog.
> Upload a sample file to the `design-plan/admin` folder for us to upload when editing the entry.

**Sample Edit Data:**

Please click VITA Tea for edit the VITA Tea information:

- Product Name: VITA Tea Lemon Taste
- Pricing:4
- Recommendation Level:4
- Description: Indulge in a refreshing and revitalizing fusion, meticulously curated from premium tea leaves delicately blended with an assortment of handpicked natural herbs and botanicals. Brimming with invigorating aromas and rich, rejuvenating flavors, this tea promises a tranquil and uplifting journey with each sip.

**Sample Upload File:** `design-plan/admin/VITA_sample.svg`


## Contributors

I affirm that I am submitting my work for the administrator requirements in this milestone.

Admin Lead: Xinyi Zhou


[← Table of Contents](../design-journey.md)
