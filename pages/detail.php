<?php
$id=$_GET['id']; //went to the office hour, and the TA taught us the method

$entry_data = exec_sql_query($db,"SELECT * FROM entry WHERE id = :id;",array(':id' => $id)
);
$records = $entry_data->fetch();

$entries = exec_sql_query($db,"SELECT * FROM entry");
$products = $entries->fetchAll();

$product_id=$records["id"];
$name=$records["name"];
$price=$records["price"];
$description=$records["description"];
$rating=$records["rating"];

$file_ext = $records["file_ext"];

$file_url = "/public/uploads/entry/" . $id . "." . $file_ext;

$tags_records = exec_sql_query(
    $db,
    "SELECT
        tags.name
    FROM tags
    INNER JOIN entry_tags ON tags.id = entry_tags.tags_id
    INNER JOIN entry ON entry_tags.entry_id = entry.id
    WHERE entry_tags.entry_id = :id",
    array(':id' => $id)
);

$tags = $tags_records->fetchAll();
?>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="/styles/site.css">
  <title>consumer-detail</title>
</head>

<body>
<h1><?php echo htmlspecialchars($name)?> Details<h1>

<div class="product-details-container">
        <div class="thumbnail-container">
        <img class="detail_img" src="<?php echo htmlspecialchars($file_url); ?>" alt="<?php echo htmlspecialchars($record["file_name"]);?>">
        </div>
        <div class="product-info">
            <h3><?php echo htmlspecialchars($name) ?></h3>
            <p>Rating:</strong> <?php echo htmlspecialchars($rating) ?></p>
            <p><strong>Pricing:</strong> <?php echo htmlspecialchars($price) ?></p>
            <?php foreach ($tags as $tag) : ?>
                <p class="tags">&#128206; <?php echo htmlspecialchars($tag["name"]) ?></p>
            <?php endforeach; ?>
            <p><strong>Description:</strong> <?php echo htmlspecialchars($description) ?></p>
        </div>
    </div>


</body>
