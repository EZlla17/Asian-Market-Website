# Project 3, Milestone 1: **Team** Design Journey

[← Table of Contents](design-journey.md)

**Make the case for your decisions using concepts from class, as well as other design principles, theories, examples, and cases from outside of class (includes the design prerequisite for this course).**

You can use bullet points and lists, or full paragraphs, or a combo, whichever is appropriate. The writing should be solid draft quality.

## Catalog
> What will your catalog website be about? (1 sentence)

The catalog website would be the website to present Asian food, allowing both consumers and administrators to view and filter the products and make entries, and allowing administrators to edit the page.


## Narrow or Wide Screen
> How will your **consumer** user access this website? From a narrow or wide screen?

Wide screen


## Catalog Design
> Sketch each page of your entire media catalog website
> Provide a brief explanation _underneath_ each sketch. (1 sentence per sketch)
> **Refer to consumer or administrator persona by name in each explanation.**

![Admin View All page](/design-plan/admin_viewall.jpg)

Admin View All page:
Administrator View All Pages uses universal design catalog pattern of tiles to display product information. In this case, the information is clearly organized for Sarah to easily view it. Thumbnail images of each product are placed on the left side of the tile. Due to the zig-zag reading pattern, Sarah will see the photos first to get a clearer picture of each product. Filters on the top use links for the filtering functions which improve Sarah's experience of using the website.

![Admin Login page](/design-plan/admin_login.jpg)

Login Page:
The login page includes a header, short welcome text, and a centrally located form. In addition, the contents are centered and aligned to stand out.

![Admin Insert page](/design-plan/admin_insert.jpg)

Admin Insert Page:
Administrator insert page is implemented like a form. It includes text input fields where admin can type in new product information and checkboxes that allows Sarah to add multiple tags for one product. The insert page is designed in a way that fits the zig-zag reading pattern so that it seems more logical and clear to Sarah.

![Admin Edit page](/design-plan/admin_edit.jpg)

Admin Edit Page:
The admin edit page is design with a form with sticky values of the old information. In this case, Sarah does not need to rewrite the those information that does not need to be changed again. Elements of the form are placed vertically and organizely. Two tags are placed in one line to save vertical space and provide good zig-zag reading pattern experience.

![Consumer View All page](/design-plan/consumer_viewall.jpg)

Consumer View All Page:
Consumer view all page is designed in a grid pattern, which is commonly seen by Sarah and easy-to-understand. It displays thumbnail of products, product name, its price, and all the tags. It also has filter feature, which allows Olivia to search for products that fit her requirement more easily. To view the details, Olivia can simply click on one specific product.

![Consumer Detail page](/design-plan/consumer_detail.jpg)

Consumer Detail Page:
Besides all the information displayed on the consumer view all page, consumer detail page contains additional information about this product, such as rating and description. After clicking one specific product in the view all page, Olivia will be taken to this detail page where gives her more information about this product.

## Catalog Design Patterns
> Explain how your design employs common catalog design patterns. (1-2 sentences)

For the consumer side, the grid pattern is used for displaying all products available on this website. Each grid consists of a thumbnail of the product, its name, and its price. The consumer will need to click on a specific product to get more details of this product, such as tags and description.

For the administrator side, tiles with a thumbnail are used for each product. The tiles include title and descriptions for each products which follows the common catalog design patterns. Some detailed information includcing their tags, and prices, and ratings are included in the tiles.

## URL Design
> Plan your HTTP routing.
> List each route and the PHP file for each route.

| Page                                     | Route       | PHP File       |
| ---------------------------------------- | ----------- | -------------- |
| home / consumer view all / filter by tag | /           | pages/home.php |
| consumer entry details                   | /consumer/detail | pages/detail.php |
| admin view all / filter by tag           | /admin/view-all | pages/view-all.php |
| admin insert entry                       | /admin/insert | pages/insert.php|
| admin edit entry / tag / untag           | /admin/edit | pages/edit.php |
| login                                    | /login | pages/login.php |

> Explain why these routes (URLs) are usable for your persona. (1 sentence)

Olivia is one of the targeted consumers. These routes are easy-to-use for her since they are all short and have self-explanatory names. They are all in lower case and connected by hyphen, which is an easy pattern to follow and type. The route "/" simply indicates that Olivia will be taken to the home page if she clicks on this link. The route "/consumer/detail" indicates that this page is affliate to consumer and Olivia will be able to see product detail if she goes to this page. In conclusion, these routes are usable for Olivia.

Sarah is one of the admins. These routes are usable for Sarah since all of these routes are not too long for Sarah to type and copy. Words are separated by hyphens and lowercase letters. There are no special characters that are difficult to type. In addition, all of these URLs are descriptive. The route "/admin/view-all" represents the view all page which is affiliate to admin. As an administrator, Sarah would click this page to view all the products. The route "/admin/insert" and the route "admin/edit" are also affiliate to admin, they are descriptive to Sarash for inserting a new entry or editing some content. The route "/login" also describes the action of login to Sarah which is also descriptive. Therefore, these routes are usable for Sarah.


## Database Schema
> Plan the structure of your database. You may use words or a picture.
> A bulleted list is probably the simplest way to do this.
> Include constraints for each field.

**Table:**

Table 1: entry_tags

- id: INTEGER{PK,U,AI,NN}
- entry_id: INTEGER{NN}
- tags_id:INTEGER{NN}

Table 2: entry

- id: INTEGER{PK,U,AI,NN}
- name: TEXT{U,NN}
- price: REAL{NN}
- description: TEXT{}
- rating: INTEGER{}

Table 3: tags

- id: INTEGER{PK,U,AI,NN}
- name:TEXT{U,NN}



## Contributors

I affirm that I have contributed to the team requirements for this milestone.

Consumer Lead: Penny Ren

Admin Lead: Xinyi Zhou


[← Table of Contents](design-journey.md)
