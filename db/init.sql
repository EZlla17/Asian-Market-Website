-- database: ../test.sqlite
-- Note: Do not delete the line above! It is helpful for testing your init.sql file.
--
-- TODO: entries, tags, and entry_tags table schemas
-- TODO: seed data

CREATE TABLE entry_tags (
  id INTEGER NOT NULL UNIQUE,
  tags_id INTEGER NOT NULL,
  entry_id INTEGER NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT) FOREIGN KEY(tags_id) REFERENCES tags(id),
  FOREIGN KEY(entry_id) REFERENCES entry(id)
);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (0, 0, 0);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (1, 1, 0);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (2, 0, 1);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (3, 1, 1);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (4, 2, 2);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (5, 4, 2);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (6, 0, 3);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (7, 1, 3);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (8, 2, 4);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (9, 2, 5);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (10, 2, 6);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (11, 2, 7);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (12, 2, 8);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (13, 3, 8);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (14, 4, 8);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (15, 0, 9);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (16, 1, 9);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (17, 2, 10);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (18, 3, 10);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (19, 4, 10);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (20, 5, 0);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (21, 5, 4);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (22, 5, 5);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (23, 6, 6);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (24, 5, 7);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (25, 0, 11);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (26, 5, 11);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (27, 1, 11);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (28, 2, 12);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (29, 7, 12);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (30, 0, 13);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (31, 1, 13);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (32, 4, 13);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (33, 6, 13);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (34, 9, 15);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (35, 0, 15);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (36, 2, 16);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (37, 6, 16);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (38, 7, 17);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (39, 0, 17);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (40, 1, 17);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (41, 2, 18);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (42, 7, 18);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (43, 0, 19);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (44, 1, 19);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (45, 8, 19);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (46, 4, 20);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (47, 6, 20);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (48, 4, 14);

INSERT INTO
  entry_tags (id, tags_id, entry_id)
VALUES
  (49, 8, 14);

CREATE TABLE tags (
  id INTEGER NOT NULL UNIQUE,
  name TEXT UNIQUE NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT)
);

INSERT INTO
  tags (id, name)
VALUES
  (0, "Drinks");

INSERT INTO
  tags (id, name)
VALUES
  (1, "Alcohol-free");

INSERT INTO
  tags (id, name)
VALUES
  (2, "Snacks");

INSERT INTO
  tags (id, name)
VALUES
  (3, "Veges");

INSERT INTO
  tags (id, name)
VALUES
  (4, "Healthy");

INSERT INTO
  tags (id, name)
VALUES
  (5, "Chinese");

INSERT INTO
  tags (id, name)
VALUES
  (6, "Korean");

INSERT INTO
  tags (id, name)
VALUES
  (7, "Japanese");

INSERT INTO
  tags (id, name)
VALUES
  (8, "Thai");

INSERT INTO
  tags (id, name)
VALUES
  (9, "Vietnamese");

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

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    0,
    "VITA Tea",
    3.5,
    "A refreshing and invigorating blend crafted with the finest handpicked tea leaves, infused with a medley of natural herbs and botanicals. Bursting with revitalizing flavors and aromatic nuances, this tea offers a soothing and rejuvenating experience with every sip.",
    5,
    "vita.svg",
    "svg",
    "https://www.yamibuy.com/en/p/vita-lime-lemon-tea-250ml/1020004851"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    1,
    "Matcha Latte",
    4.99,
    "A creamy and aromatic Japanese green tea latte made with finely ground matcha powder and steamed milk, topped with froth.",
    4,
    "Matcha_Latte.svg",
    "svg",
    "https://www.yamibuy.com/zh/p/original-matcha-sugar-and-milk-190g/5157004801?utm_source=google&utm_medium=cpc&utm_campaign=T_121022_PMax_Snack_and_Beverage_CN&gad_source=1&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJdEvG1xEvEhl3ED0jGzGBrZ5v1hw-RB1GZM-jrBmAuK_c23LRmrI5RoC9pIQAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    2,
    "Avocado Toast",
    7.99,
    "A trendy and nutritious breakfast or snack option featuring mashed avocado seasoned with salt, pepper, and lemon juice, spread on whole-grain toast and garnished with cherry tomatoes and microgreens.",
    4,
    "Avocado-Toast.svg",
    "svg",
    "https://www.target.com/p/sabra-avocado-toast-2-7oz/-/A-53855884?ref=tgt_adv_xsp&AFID=google&fndsrc=tgtao&DFA=71700000108264733&CPNG=PLA_Bakery%2BDeli%2BShopping_Local%7CBakery%2BDeli_Ecomm_Food_Bev&adgroup=SC_Bakery%2BDeli&LID=700000001170770pgs&LNM=PRODUCT_GROUP&network=g&device=c&location=9005779&targetid=pla-674481428314&gad_source=1&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJScjrC_Tgq7-Q2eopOH3BfvjjPz80Zs69bmibRrA93SnJb76QoiscxoCKxAQAvD_BwE&gclsrc=aw.ds"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    3,
    "Turmeric Ginger Tea",
    3.5,
    "A soothing and aromatic herbal tea blend made with freshly grated ginger, ground turmeric, honey, and hot water, providing warmth and immune-boosting properties.",
    5,
    "Turmeric-Ginger-Tea.svg",
    "svg",
    "https://www.amazon.com/Prince-Peace-Instant-Crystals-Turmeric/dp/B0BRBQX27R/ref=asc_df_B0BRBQX27R/?tag=hyprod-20&linkCode=df0&hvadid=663304878205&hvpos=&hvnetw=g&hvrand=8152551034901562117&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-2187748069615&psc=1&mcid=26afb13de27831ee80562f942fdcfcd4"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    4,
    "Five Spice Tofu Jerky",
    6.6,
    "Chewy tofu strips marinated in a savory blend of Chinese five spice seasoning, offering a flavorful and protein-packed snack option.",
    5,
    "Tofu-Jerky.svg",
    "svg",
    "https://www.amazon.com/Phuumy-Chilli-Mushroom-Authentic-Taiwanese/dp/B0CLYBS1LS/ref=asc_df_B0CLYBS1LS/?tag=hyprod-20&linkCode=df0&hvadid=686132501254&hvpos=&hvnetw=g&hvrand=9613662197555583144&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-2475088259432&psc=1&mcid=8292938ac3b835da872bd5d0b89dee7d&gad_source=1&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJVcDuHSK5STCpYp5hI_pMXoCKYYHmtSJ4UNTBttGSLQyAnF9kkLJHxoClSgQAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    5,
    "Crispy Sesame Seaweed Chips",
    5,
    "A savory and addictive snack featuring thin, crispy sheets of roasted seaweed seasoned with a blend of sesame seeds, salt, and a hint of natural umami flavor. These chips offer a satisfying crunch with a delicate balance of salty and nutty notes, making them a perfect choice for a flavorful and healthy snack option.",
    5,
    "Sesame-Chips.svg",
    "svg",
    "https://www.heb.com/product-detail/gimme-roasted-seaweed-snack-toasted-sesame/1688242"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    6,
    "Kimchi Rice Crackers",
    8.8,
    "Crunchy rice crackers seasoned with spicy and tangy kimchi flavor, providing a satisfying snack experience.",
    3,
    "Kimchi-Rice.svg",
    "svg",
    "https://www.amazon.com/Korean-Flavor-Shindangdong-Tteokbboki-Original/dp/B07RH9ZYQP/ref=asc_df_B07RH9ZYQP/?tag=hyprod-20&linkCode=df0&hvadid=652394615229&hvpos=&hvnetw=g&hvrand=12923915161040325300&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-2065499688690&psc=1&mcid=148d73c12aba327684b8e7fb1b402b0e"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    7,
    "Spicy Sichuan Peanuts",
    1.5,
    "Roasted peanuts coated in a fiery blend of Sichuan spices, providing a bold and addictive snacking experience.",
    5,
    "Spicy-Peanuts.svg",
    "svg",
    "https://www.amazon.com/Huang-Hong-Spicy-Peanuts-3-88/dp/B078JXYBL8/ref=asc_df_B078JXYBL8/?tag=hyprod-20&linkCode=df0&hvadid=652500688709&hvpos=&hvnetw=g&hvrand=15901990874809275797&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-2066585769240&psc=1&mcid=2b8622e95ed730d9b3e85e3283413be4"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    8,
    "Wasabi Roasted Edamame",
    3.49,
    "Crunchy roasted edamame beans dusted with zesty wasabi seasoning, providing a flavorful and nutritious snack option.",
    5,
    "Wasabi-Edamame.svg",
    "svg",
    "https://www.amazon.com/Hapi-Wasabi-Pouch-4-23-Ounce/dp/B00LPEBA5O/ref=asc_df_B00LPEBA5O/?tag=hyprod-20&linkCode=df0&hvadid=241968125727&hvpos=&hvnetw=g&hvrand=6478754854524321284&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-494467274567&psc=1&mcid=da3dce4bce5a3ff6a0659c25d1aff8c3&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJd0FJP0HdXklF2fELAAQMRuX1wXmhh4nA2ppApzEK-QydLKeGrN6iBoC4rIQAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    9,
    "Sakura Blossom Herbal Tea",
    4.89,
    "Fragrant herbal tea infused with delicate cherry blossom petals, offering a soothing and floral-infused beverage.",
    3,
    "Sakura-Tea.svg",
    "svg",
    "https://www.amazon.com/Japanese-3g%C3%9715bags-Blossom-Flavored-%E3%80%90YAMASAN%E3%80%91/dp/B09T2LFPR2/ref=asc_df_B09T2LFPR2/?tag=hyprod-20&linkCode=df0&hvadid=563732617415&hvpos=&hvnetw=g&hvrand=13343987260133221396&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-1653065623351&psc=1&mcid=3e30e50dbb9f3dbbb3d6082570bb3781&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJYsQARFV8hvhYDwAu29PIGWg91R1S3DPd89LQZsTCG80pZ2CC4_UtRoC1ksQAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    10,
    "Seaweed Snack Packs",
    5.5,
    "Individual packs of crispy roasted seaweed sheets seasoned with sesame oil and sea salt, providing a nutritious and savory snack on the go.",
    4,
    "Seaweed-Packs.svg",
    "svg",
    "https://www.target.com/p/gimme-organic-roasted-seaweed-snack-sea-salt-35oz/-/A-17264592?ref=tgt_adv_xsp&AFID=google&fndsrc=tgtao&DFA=71700000108264736&CPNG=PLA_Dry%2BGrocery%2BShopping_Local%7CDry%2BGocery_Ecomm_Food_Bev&adgroup=SC_Dry%2BGrocery&LID=700000001170770pgs&LNM=PRODUCT_GROUP&network=g&device=c&location=9005779&targetid=aud-554348709499%3Apla-615728629881&gad_source=1&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJR2Xj5xSZv1jzAj8peK_m1EBn6Fegd_JWTbsig_cEoOQghC_spmw5BoCa8wQAvD_BwE&gclsrc=aw.ds"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    11,
    "Jasmine Pearl Tea",
    5.99,
    "Fragrant green tea infused with delicate jasmine blossoms, offering a soothing and aromatic beverage with floral notes.",
    4,
    "Jasmine-Tea.svg",
    "svg",
    "https://www.amazon.com/Sou-Zen-Corn-fiber-Hand-Rolled-Preservatives/dp/B09LVW6PQW/ref=asc_df_B09LVW6PQW/?tag=hyprod-20&linkCode=df0&hvadid=652500688712&hvpos=&hvnetw=g&hvrand=15170900893059854742&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-2067504292257&psc=1&mcid=0963f34ae83e3a5fa3d3f720392547c1"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    12,
    "Miso Soup Crackers",
    4.49,
    "Crunchy crackers seasoned with savory miso soup flavor, reminiscent of the classic Japanese soup in a convenient snack form.",
    3,
    "Miso-Crackers.svg",
    "svg",
    "https://hikarimiso.com/products/"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    13,
    "Barley Tea",
    3.29,
    "Nutty and refreshing roasted barley tea brewed from roasted barley grains, offering a caffeine-free beverage option enjoyed in Korean cuisine.",
    4,
    "Barley-Tea.svg",
    "svg",
    "https://www.amazon.com/Organic-8g%C3%9730bags-chemical-fertilizer-Caffeine/dp/B086X6KRMG/ref=asc_df_B086X6KRMG/?tag=hyprod-20&linkCode=df0&hvadid=598278424744&hvpos=&hvnetw=g&hvrand=14308471793936598638&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-1408688938547&psc=1&mcid=6422e27e12bb3c94a3aa7e198f6951b7&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJWJXVIKxTF_fxlczuvPmJ7g0D48gZBoHs2GSWjR4n-xyjAjbjlNyMBoCo3MQAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    14,
    "Green Papaya Salad Kit",
    7.99,
    "DIY salad kit containing shredded green papaya, carrots, peanuts, and a tangy dressing, offering a fresh and healthy salad inspired by Thai cuisine.",
    4,
    "Salad-Kit.svg",
    "svg",
    "https://www.walmart.com/ip/Taylor-Farms-Buffalo-Ranch-Chopped-Salad-Kit-13-5-oz-Fresh/550930706?wmlspartner=wlpa&selectedSellerId=0&wl13=1781&adid=22222222277550930706_117755028669_12420145346&wmlspartner=wmtlabs&wl0=&wl1=g&wl2=c&wl3=501107745824&wl4=pla-306310554666&wl5=9005779&wl6=&wl7=&wl8=&wl9=pla&wl10=8175035&wl11=local&wl12=550930706&wl13=1781&veh=sem_LIA&gclsrc=aw.ds&&adid=22222222237550930706_117755028669_12420145346&wl0=&wl1=g&wl2=c&wl3=501107745824&wl4=pla-306310554666&wl5=9005779&wl6=&wl7=&wl8=&wl9=pla&wl10=8175035&wl11=local&wl12=550930706&veh=sem&gad_source=1&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJQUApuNTyC_PH2wQStKQqbpibTHNu2DJY9DdNbrqXx8G-sviqzd06BoCkGYQAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    15,
    "Vietnamese Iced Coffee",
    4.99,
    "Strong and aromatic Vietnamese coffee brewed with condensed milk, served over ice, offering a sweet and creamy beverage option popular in Vietnam.",
    5,
    "Vietnamese-Coffee.svg",
    "svg",
    "https://www.amazon.com/Cafe-Pho-instant-Coffee-sachets/dp/B07BVRSC52/ref=asc_df_B07BVRSC52/?tag=hyprod-20&linkCode=df0&hvadid=242033841575&hvpos=&hvnetw=g&hvrand=8138786121596397426&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-646603038415&psc=1&mcid=e2808efb4c023505ab53c97532dcabb0&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJSI112qRk9rBqBmRIkXK2y66dmQPVmq-7WRBilK34Ka2O2tkTuiPaBoCav4QAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    16,
    "Kimchi Flavored Popcorn",
    3.79,
    "Air-popped popcorn seasoned with spicy and tangy kimchi seasoning, offering a flavorful and crunchy snack inspired by Korean flavors.",
    4,
    "Kimchi-Popcorn.svg",
    "svg",
    "https://shopee.com.my/Eureka-Korea-Kimchi-Popcorn-Snack-%28Paper-Can%29-i.149143897.3218209237"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    17,
    "Ramune Soda",
    1.99,
    "Refreshing Japanese soda with a unique marble stopper, available in a variety of fruity flavors, offering a fun and nostalgic beverage experience.",
    5,
    "Ramune-Soda.svg",
    "svg",
    "https://www.amazon.com/Ramune-Japanese-Soda-Variety-Pack/dp/B07RZ17V2F/ref=asc_df_B07RZ17V2F/?tag=hyprod-20&linkCode=df0&hvadid=366315040932&hvpos=&hvnetw=g&hvrand=18120977909401229519&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-801316211744&psc=1&mcid=6ec21c7cce1a36aca492da3d7153ddbb&tag=&ref=&adgrpid=76502786536&hvpone=&hvptwo=&hvadid=366315040932&hvpos=&hvnetw=g&hvrand=18120977909401229519&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-801316211744&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJR7exRGOc4IoEFKGnaffarJgQOd286O6cTQoI8MhJGfUxmVSVf-w_xoCK_EQAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    18,
    "Wasabi Peas",
    2.49,
    "Crunchy roasted green peas coated in spicy wasabi seasoning, offering a bold and addictive snack with a kick of heat.",
    4,
    "Wasabi-Peas.svg",
    "svg",
    "https://www.amazon.com/Hapi-Wasabi-Spicy-Sriracha-Combo/dp/B00IDA5KQS/ref=asc_df_B00IDA5KQS/?tag=hyprod-20&linkCode=df0&hvadid=312198206296&hvpos=&hvnetw=g&hvrand=3281034874564137024&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-568538555467&psc=1&mcid=c6b3a7a8eee43a269fc316a8e393c99d&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJT0j5pzPWB1JeAAgKf_l_ZkKxu-nRPlGUAar6bLqQvxHi55yO11XexoC9nQQAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    19,
    "Thai Iced Tea Mix",
    5.49,
    "Traditional Thai tea mix made from black tea leaves, spices, and condensed milk powder, offering a sweet and creamy beverage when mixed with ice and water.",
    5,
    "Thai-Tea.svg",
    "svg",
    "https://www.amazon.com/Fusion-Select-2-2lb-Powder-Flavored-3/dp/B099KNC7R7/ref=asc_df_B099KNC7R7/?tag=hyprod-20&linkCode=df0&hvadid=598351469660&hvpos=&hvnetw=g&hvrand=17958654411794091849&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-1707338384364&psc=1&mcid=43c71542d1803eb7a1c18d64a964043a&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJZ55bn80p6OVO8EfSTMVXp5IpaYWmrwziOSDrX34Rt4NwKP3i6PVjRoCdrEQAvD_BwE"
  );

INSERT INTO
  entry (id, name, price, description, rating,file_name,file_ext,source)
VALUES
  (
    20,
    "Korean Plum Extract",
    11.99,
    "Sweet and tangy plum extract made from ripe Korean plums, offering a refreshing and fruity beverage when diluted with water or added to cocktails.",
    5,
    "Korean-Extract.svg",
    "svg",
    "https://www.amazon.com/LENITH-Premium-Maesil-Extract-Antioxidants/dp/B08WC5WR8D/ref=asc_df_B08WC5WR8D/?tag=hyprod-20&linkCode=df0&hvadid=532798203735&hvpos=&hvnetw=g&hvrand=7378823678855368607&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9005779&hvtargid=pla-1410617802379&psc=1&mcid=43984a8697583f87ade6eab471013447&gclid=CjwKCAjw5v2wBhBrEiwAXDDoJS2keO1CFgEQu7B5wuBx0yIRfWEDCIWAkSs0jS15nlX7RktMI6DazhoCzhEQAvD_BwE"
  );



CREATE TABLE users (
  id INTEGER NOT NULL UNIQUE,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  username TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT)
);

INSERT INTO
  users (id, name, email, username, password)
VALUES
  (
    0,
    'Xinyi Zhou',
    'xz255@cornell.edu',
    'ezlla',
    '$2y$10$QtCybkpkzh7x5VN11APHned4J8fu78.eFXlyAMmahuAaNcbwZ7FH.'
  );

INSERT INTO
  users (id, name, email, username, password)
VALUES
  (
    1,
    'Penny Ren',
    'xr39@cornell.edu',
    'penny',
    '$2y$10$QtCybkpkzh7x5VN11APHned4J8fu78.eFXlyAMmahuAaNcbwZ7FH.'
  );

CREATE TABLE sessions (
  id INTEGER NOT NULL UNIQUE,
  user_id INTEGER NOT NULL,
  session TEXT NOT NULL UNIQUE,
  last_login TEXT NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT) FOREIGN KEY(user_id) REFERENCES users(id)
);
