<li class="tile-list">
    <a class="link home-link" href="/admin/edit?<?php echo $query_string; ?>">
        <div class="tile">
            <div class="thumbnail">
                <img class="product_img" src="<?php echo htmlspecialchars($file_url); ?>" alt="<?php echo htmlspecialchars($record["file_name"]); ?>">
            </div>
            <div class="product-info width">
                <div class="food-name general-padding">
                    <h3><?php echo htmlspecialchars($product_name) ?></h3>
                    <p><strong>Edit</strong></p>
                </div>
                <div class="tile-padding">
                    <div class="row">
                        <p><strong>rating:</strong><?php echo htmlspecialchars($rating) ?></p>
                        <p><strong>pricing:</strong><?php echo htmlspecialchars($pricing) ?></p>
                    </div>
                    <div class="row">
                        <?php foreach ($records2 as $record2_single) : ?>
                            <p class="tags">&#128206;<?php echo htmlspecialchars($record2_single["tags.name"]) ?></p>
                        <?php endforeach; ?>

                    </div>
                    <p><?php echo htmlspecialchars($description) ?></p>
                </div>
            </div>
        </div>
    </a>
</li>
