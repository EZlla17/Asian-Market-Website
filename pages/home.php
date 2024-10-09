<?php
$db = init_sqlite_db("db/site.sqlite", "db/init.sql");

$tags_names= exec_sql_query($db, "SELECT tags.id as 'tags.id', tags.name as 'tags.name' FROM tags;");
$tag_records=$tags_names->fetchAll();

$tag_param = $_GET['tag_id'] ?? NULL;

$sql_select_clause = "SELECT entry.name as 'entry.name',
entry.id as 'entry.id',
entry.price as 'entry.price',
entry.rating as 'entry.rating',
entry.description as 'entry.description',
entry.file_name as 'entry.file_name',
entry.file_ext as 'entry.file_ext'
FROM entry
INNER JOIN entry_tags ON entry_tags.entry_id = entry.id
INNER JOIN tags ON entry_tags.tags_id = tags.id";

$sql_where_clause = "";

if($tag_param !== NULL) {
  $sql_where_clause = " WHERE entry_tags.tags_id = ". $tag_param;
  $sql_select_query = $sql_select_clause . $sql_where_clause . ";";
}else{
  $sql_select_query = "SELECT entry.name as 'entry.name',
  entry.id as 'entry.id',
  entry.price as 'entry.price',
  entry.rating as 'entry.rating',
  entry.description as 'entry.description',
  entry.file_name as 'entry.file_name',
  entry.file_ext as 'entry.file_ext' FROM entry";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="/styles/site.css">
  <title>consumer-homepage</title>
</head>

<body>

  <h1>Home</h1>

  <h1>Search Product by Tags</h1>

  <div class="tags-list">
    <strong><a class="tags-link" href="/">All</a></strong>
    <?php
    foreach ($tag_records as $tag_record){
      $tagid=$tag_record["tags.id"];
      $tag_name=$tag_record["tags.name"];
      $tag_querystring = http_build_query(array('tag_id' => $tagid));
      include 'includes/consumer_filter.php';
    }
    ?>
  </div>

  <!-- Source: data provided by Chat GPT -->
  <!-- Source: images searched from Google -->
  <div class="grid-container">
    <?php
    $data = exec_sql_query(
      $db,$sql_select_query
    );

    $records = $data->fetchAll();

    //go to the office hour and TA teaches us how to write the foreach loop and query to match the prodcut with the tags.

    foreach ($records as $single_record) {
      $id = $single_record["entry.id"];
      $name = $single_record["entry.name"];
      $pricing = $single_record["entry.price"];

      $file_ext = $single_record["entry.file_ext"];

      $file_url = "/public/uploads/entry/" . $id . "." . $file_ext;

      $query_string = http_build_query(array('id' => $id));

      $tags = exec_sql_query(
        $db,
        "SELECT
            tags.name
        FROM tags
        INNER JOIN entry_tags ON tags.id = entry_tags.tags_id
        INNER JOIN entry ON entry_tags.entry_id = entry.id
        WHERE entry_tags.entry_id = :id",
        array(':id' => $single_record['entry.id'])
    );

      $records2 = $tags->fetchAll();
      include 'includes/grid.php';
    }
    ?>
  </div>

<p>Data sourced from ChatGPT</p>

</body>

</html>
