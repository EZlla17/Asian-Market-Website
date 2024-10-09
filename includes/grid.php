<a class="link" href="/detail?<?php echo $query_string; ?>">

<div class="grid-item">

<div class="thumbnail">
    <img class="consumer_img" src="<?php echo htmlspecialchars($file_url); ?>" alt="<?php echo htmlspecialchars($record["file_name"]);?>">
</div>

    <h2><?php echo htmlspecialchars($name); ?></h2>

    <p>Price: $<?php echo htmlspecialchars($pricing); ?></p>
    <?php foreach ($records2 as $record2_single) : ?>
    <p class="tags">&#128206;<?php echo htmlspecialchars($record2_single["name"]) ?></p>


    <?php endforeach; ?>

</div>
</a>
