<?php
if (is_user_logged_in()) {

$id = $_GET['id']; //went to the office hour, and the TA taught us the method

$entry_data = exec_sql_query(
    $db,
    "SELECT * FROM entry WHERE id = :id;",
    array(':id' => $id)
);
$records = $entry_data->fetch();

$entries = exec_sql_query($db, "SELECT * FROM entry");
$products = $entries->fetchAll();

$product_id = $records["id"];
$name = $records["name"];
$price = $records["price"];
$description = $records["description"];
$rating = $records["rating"];
$file_name=$records["file_name"];
$file_ext=$records["file_ext"];
$file_url = "/public/uploads/entry/" . $id . "." . $file_ext;


$records3 = exec_sql_query(
    $db,
    "SELECT
        tags.name
    FROM tags
    INNER JOIN entry_tags ON tags.id = entry_tags.tags_id
    INNER JOIN entry ON entry_tags.entry_id = entry.id
    WHERE entry_tags.entry_id = :id",
    array(':id' => $id)
);

$data3 = $records3->fetchAll();


$select_1 = ($rating == 1 ? "selected" : "");
$select_2 = ($rating == 2 ? "selected" : "");
$select_3 = ($rating == 3 ? "selected" : "");
$select_4 = ($rating == 4 ? "selected" : "");
$select_5 = ($rating == 5 ? "selected" : "");

$form_values = array(
    "name" => "",
    "pricing" => "",
    "rating" => "",
    "description" => "",
    "id"=>$id
);

$upload_feedback = array(
    "general_error" => false,
    "too_large" => false
  );

$upload_source = NULL;
$upload_file_name = NULL;
$upload_file_ext = NULL;

$query_string=http_build_query(array('id' => $id));

if (isset($_POST["request"])) {

    $form_values["name"] = trim($_POST["name"]);
    $form_values["pricing"] = (float)$_POST["pricing"];
    $form_values["description"] = trim($_POST["description"]);
    $form_values["rating"] = (int)$_POST["rating"];

    $upload_source = trim($_POST["source"])=="" ?trim($_POST["source"]):NULL; // untrusted
    $upload = $_FILES["svg-file"];
    $form_valid = true;

    if ($upload["error"] == UPLOAD_ERR_OK) {
        $upload_file_name = basename($upload["name"]);
        $upload_file_ext = strtolower(pathinfo($upload_file_name, PATHINFO_EXTENSION));
        if (!in_array($upload_file_ext, array("svg"))) {
          $form_valid = false;
          $upload_feedback["general_error"] = true;
        }
    }else if (($upload["error"] == UPLOAD_ERR_INI_SIZE) || ($upload["error"] == UPLOAD_ERR_FORM_SIZE)) {
        $form_valid = false;
        $upload_feedback["too_large"] = true;
      } else {
        $form_valid = false;
        $upload_feedback["general_error"] = true;
      }

    if ($form_valid) {

        $update = exec_sql_query($db, "UPDATE entry SET name= :name, price = :price, rating = :rating, description = :description,file_name=:file_name, file_ext=:file_ext, source=:source WHERE id = :id", array(
            ':id' => $form_values["id"],
            ':name' => $form_values["name"],
            ':price' => $form_values["pricing"],
            ':rating' => $form_values["rating"],
            ':description' => $form_values["description"],
            ':file_name' => $upload_file_name,
            ':file_ext' => $upload_file_ext,
            ':source' => $upload_source
        ));

        //went to the office hour, and the TA taught me how to delet the old img and add the new.
        if ($update) {
            $old_file = "public/uploads/entry/" . $form_values["id"] . "." . $file_ext;
            $upload_storage_path = "public/uploads/entry/" . $form_values["id"] . "." . $upload_file_ext;
            if (file_exists($old_file)) {
                unlink($old_file_path);
            }
            if (move_uploaded_file($upload["tmp_name"], $upload_storage_path) == false) {
                error_log("Failed to permanently store the uploaded file on the file server. Please check that the server folder exists.");
              }
          }


        $entry_data = exec_sql_query(
            $db,
            "SELECT * FROM entry WHERE id = :id;",
            array(':id' => $id)
        );
        $records = $entry_data->fetch();

        $product_id = $records["id"];
        $name = $records["name"];
        $price = $records["price"];
        $description = $records["description"];
        $rating = $records["rating"];
        $file_name=$records["file_name"];
        $file_ext=$records["file_ext"];
        $file_url = "/public/uploads/entry/" . $id . "." . $file_ext;
    }

}

define("MAX_FILE_SIZE", 2000000);
}
?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/styles/site.css">
    <title>admin-edit</title>
</head>


<body>
    <h1>Product Information</h1>

    <?php if (is_user_logged_in()) { ?>
    <div class="header">
        <a href="/admin">Back To View All</a>
    </div>

    <div class="tile">
        <div class="thumbnail">
            <img class="product_img" src="<?php echo htmlspecialchars($file_url); ?>" alt="<?php echo htmlspecialchars($record["file_name"]); ?>">
        </div>
        <div class="width">
            <div class="food-name general-padding">
                <h3><?php echo htmlspecialchars($name) ?></h3>
            </div>
            <div class="tile-padding">
                <div class="row">
                    <p><strong>rating:</strong><?php echo htmlspecialchars($rating) ?></p>
                    <p><strong>pricing:</strong><?php echo htmlspecialchars($price) ?></p>
                </div>
                <div class="row">
                    <?php foreach ($data3 as $tag) : ?>
                        <p class="tags">&#128206;<?php echo htmlspecialchars($tag["name"]) ?></p>
                    <?php endforeach; ?>
                </div>
                <p><strong>Description: </strong><?php echo htmlspecialchars($description) ?></p>
            </div>
        </div>
    </div>


    <form class="edit_form" action="/admin/edit?<?php echo $query_string; ?>" method="post" enctype="multipart/form-data">

        <h2 class="edit-title">Update Product Information</h2>

        <input type="hidden" name="id" value="<?php echo $id; ?>">
        <input type="hidden" name="MAX_FILE_SIZE" value="<?php echo MAX_FILE_SIZE; ?>">

        <?php if ($upload_feedback["too_large"]) { ?>
          <p class="feedback">Sorry, the file failed to upload because it was too big. Please select a file less than 2 MB.</p>
        <?php } ?>

        <?php if ($upload_feedback["general_error"]) { ?>
          <p class="feedback">Please select an SVG file to upload.</p>
        <?php } ?>

        <div class="form-padding">
                <label for="product-name">Product Name:</label>
                <input type="text" id="product_name" name="name" value="<?php echo htmlspecialchars($name)?>">

            <div>

                <div class="form-padding">
                    <label for="pricing">pricing:$</label>
                    <input type="text" id="pricing" name="pricing" value="<?php echo htmlspecialchars($price) ?>">
                </div>

                <div class="form-padding">
                    <label for="rating">Recommendation level</label>
                    <select id="rating" name="rating">
                        <option value=1 <?php echo $select_1 ?>>1</option>
                        <option value=2 <?php echo $select_2 ?>>2</option>
                        <option value=3 <?php echo $select_3 ?>>3</option>
                        <option value=4 <?php echo $select_4 ?>>4</option>
                        <option value=5 <?php echo $select_5 ?>>5</option>
                    </select>
                </div>

                <div>
                    <label for="upload-file">SVG File:</label>
                    <input id="upload-file" type="file" name="svg-file" accept=".svg,image/svg+xml">
                </div>

                <div>
                    <label for="upload-source" class="optional">Source URL:</label>
                    <input id="upload-source" type="url" name="source" placeholder="Please provide the URL of the image.(Optional)">
                </div>

                <div class="form-padding">
                    <label for="description">Description</label>
                    <textarea id="description" name="description"><?php echo htmlspecialchars($description) ?></textarea>
                </div>

                <div class="right top-sapce form-padding">
                    <input type="submit" id="contact-button" value="Save Changes" name="request">
                </div>


    </form>

    <?php } else { ?>
    <div class="login insert_form">
      <h2>Sign In</h2>
      <p>Please login as an administrator.</p>

      <?php echo login_form('/admin/edit#upload', $session_messages);} ?>

    </div>


</body>
