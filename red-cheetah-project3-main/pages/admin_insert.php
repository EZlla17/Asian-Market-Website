<?php
if (is_user_logged_in()) {
define("MAX_FILE_SIZE", 2000000);

if (isset($_POST["add-product"])) {
    $name = $_POST["name"];
    $pricing = $_POST["pricing"];
    $rating = $_POST["rating"];
    $description = $_POST["description"];

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
        $result = exec_sql_query(
            $db,
            "INSERT INTO entry(name, price, description, rating, file_name, file_ext, source) VALUES(:name, :pricing, :description, :rating, :upload_file_name, :upload_file_ext, :upload_source)",
            array(
                ':name' => $name,
                ':pricing' => $pricing,
                ':rating' => $rating,
                ':description' => $description,
                ':upload_file_name' => $upload_file_name,
                ':upload_file_ext' => $upload_file_ext,
                ':upload_source' => $upload_source
            )
        );

        $record_id = $db->lastInsertId("id");
        $upload_storage_path = "public/uploads/entry/" . $record_id . "." . $upload_file_ext;
        if (move_uploaded_file($upload["tmp_name"], $upload_storage_path) == false) {
            error_log("Failed to permanently store the uploaded file on the file server. Please check that the server folder exists.");
        }
    }
}
}
?>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/styles/site.css">
    <title>admin-insert</title>
</head>

<body class="insert-page">
    <?php if (is_user_logged_in()) { ?>
    <a href="/admin">View All</a>
    <form class="insert_form" action="/admin/insert" method="post" enctype="multipart/form-data">
        <h2 class="insert_title">Add a New Product</h2>

    <input type="hidden" name="MAX_FILE_SIZE" value="<?php echo MAX_FILE_SIZE; ?>">

    <div class="form-padding">
        <label for="product-name">Product Name: </label>
        <input type="text" id="name" name="name">
    </div>

    <div class="form-padding">
        <label for="pricing">Pricing: $</label>
        <input type="text" id="pricing" name="pricing">
    </div>

    <div class="form-padding">
        <label for="rating">Recommendation level</label>
        <select id="rating" name="rating" name="rating">
            <option value=1>1</option>
            <option value=2>2</option>
            <option value=3>3</option>
            <option value=4>4</option>
            <option value=5>5</option>
        </select>
    </div>

    <div>
        <label for="upload-file">SVG File:</label>
        <input id="upload-file" type="file" name="svg-file" accept=".svg,image/svg+xml">
    </div>

    <div>
        <label for="upload-source" class="optional">Source URL:</label>
        <input id="upload-source" type="url" name="source" placeholder="URL where found. (optional)">
    </div>

    <div class="form-padding">
        <label for="description">Description</label>
        <textarea id="description" name="description"></textarea>
    </div>

    <div class="right top-sapce form-padding">
        <input type="submit" id="contact-button" value="Add a New Product" name="add-product">
    </div>
    </form>

    <?php } else { ?>
    <div class="login insert_form">
      <h2>Sign In</h2>
      <p>Please login as an administrator.</p>

      <?php echo login_form('/admin/insert#upload', $session_messages);} ?>

    </div>
</body>
