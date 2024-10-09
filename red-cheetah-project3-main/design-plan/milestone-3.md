# Project 3, Milestone 3: **Team** Design Journey

[← Table of Contents](design-journey.md)

**Make the case for your decisions using concepts from class, as well as other design principles, theories, examples, and cases from outside of class (includes the design prerequisite for this course).**

You can use bullet points and lists, or full paragraphs, or a combo, whichever is appropriate. The writing should be solid draft quality.


## Milestone 2 Team Feedback Revisions
> Explain what your **team** collectively revised in response to the Milestone 2 feedback (1-2 sentences)
> If you didn't make any revisions, explain why.

Add parameter markers to our second query which we get points off from the last milestone.



## File Upload - Types of Files
> What types of files will you allow users to upload?
> Can users upload any type of file? Can user only upload one type of file?
> Or can users upload several different types of files?
> List the file extensions of the types of files your users may upload.

- svg file type
- Administrators can only upload one type of file, the svg file. The svg file type keeps the file size relatively small compared to other types of files such as jpeg, png, etc., thus avoiding site crashes.
- users can not upload several different types of files.
- the file extension for svg file is: .svg


## File Upload - Updated DB Schema
> Plan any updates you need to make to your database schema to support file uploads.
>
> 1. Copy your Project 3 DB Schema for the _entries_ table here.
> 2. Modify the schema to include any file upload information you desire to store in your database.
>    If you don't need to modify anything, explain why.

entries table name: entry

```
CREATE TABLE entry(
  id INTEGER NOT NULL UNIQUE,
  name TEXT UNIQUE NOT NULL,
  price REAL NOT NULL,
  description TEXT,
  rating INTEGER,
  file_name TEXT NOT NULL,
  file_ext TEXT NOT NULL,
  source TEXT,
  PRIMARY KEY(id AUTOINCREMENT)
);
```



## File Upload - File Storage
> Plan the file path to store the uploaded files on the server's file system.
> Store the uploaded files in a subfolder of the `public/uploads` folder using the entries table name as the subfolder name.

public/uploads/food/id.file_ext


## File Upload - Path and URL
> Assume that a user completed the insert/edit entry form.
> The **id** for the new record is **154**.
>
> 1. Plan the file system path to store the uploaded file.
> 2. Plan the URL to load the uploaded file in your website's HTML.

**File System Storage Path:**

```
public/uploads/food/154.svg
```

**Resource URL:**

```
<picture>
  <img src="/public/uploads/food/154.svg">
</picture>
```


## File Upload - Form Input
> Write the HTML of an `<input>` element that allows users to upload a file.

```html
<input id="upload-file" type="file" name="svg-file" accept=".svg,image/svg+xml">
```


## File Upload - PHP File Upload Data
> Use the `name` attribute of the file input you planned above to plan how you will
> access the uploaded file data in PHP using the `$_FILES` superglobal.

> Write the PHP code to access the uploaded file data from the `$_FILES` superglobal.
> Only include the data you will extract from the `$_FILES` superglobal. For example, the file name.
> Hint: <https://www.php.net/manual/en/features.file-upload.post-method.php>

```
$upload=$_FILES["svg-file"]
```


## Filtering by a Tag - Query String Parameters
> Plan the query string for filtering by a tag for the "view all" pages.
> (This plan should be exactly the same for both the consumer and admin views.)
> Include the query string parameter and its value.
> Document the value with the field from your database in all CAPITOL letters.

Example: `?category=ID` where `ID` is the `id` field from the `categories` table.

?tag_id=tagid where tagid is the id field from the tags table.


## Filtering by a Tag - SQL Query Plan
> Plan the SQL query to retrieve all entries with a specific tag using the query string parameter.

```
$sql_select_clause = "SELECT entry.name as 'entry.name',
                      entry.id as 'entry.id',
                      entry.price as 'entry.price',
                      entry.rating as 'entry.rating',
                      entry.description as 'entry.description',
                      entry.file_name as 'entry.file_name',
                      entry.file_ext as 'entry.file_ext'
                      FROM entry
                      INNER JOIN entry_tags ON entry_tags.entry_id =entry.id
                      INNER JOIN tags ON entry_tags.tags_id = tags.id"
```


## Contributors

I affirm that I have contributed to the team requirements for this milestone.

Consumer Lead: Penny Ren

Admin Lead: Xinyi Zhou


[← Table of Contents](design-journey.md)
