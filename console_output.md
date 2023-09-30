david@pi:~/Desktop/Code/rails/blog$ rails console
Loading development environment (Rails 7.0.8)
irb(main):001> Article.colum_names
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activerecord-7.0.8/lib/active_record/dynamic_matchers.rb:22:in `method_missing': undefined method `colum_names' for Article:Class (NoMethodError)
Did you mean?  column_names
irb(main):002> Article.column_names
=> 
["id",
 "title",
 "body",
 "published_at",
 "created_at",
 "updated_at",
 "excerpt",
 "location"]
irb(main):003> Article
=> Article(id: integer, title: string, body: text, published_at: datetime, created_at: datetime, updated_at: datetime, excerpt: string, location: string)
irb(main):004> Article.methods.size
=> 769
irb(main):005> 
^C
irb(main):005> exit
david@pi:~/Desktop/Code/rails/blog$ rails db:reset
Dropped database 'db/development.sqlite3'
Database 'db/test.sqlite3' does not exist
Created database 'db/development.sqlite3'
Created database 'db/test.sqlite3'
david@pi:~/Desktop/Code/rails/blog$ rails console
Loading development environment (Rails 7.0.8)
irb(main):001> article = Article.new
=> 
#<Article:0x0000ffffa1573298
...
irb(main):002> Article
=> Article(id: integer, title: string, body: text, published_at: datetime, created_at: datetime, updated_at: datetime, excerpt: string, location: string)
irb(main):003> exit
david@pi:~/Desktop/Code/rails/blog$ rails db:reset
Dropped database 'db/development.sqlite3'
Dropped database 'db/test.sqlite3'
Created database 'db/development.sqlite3'
Created database 'db/test.sqlite3'
david@pi:~/Desktop/Code/rails/blog$ rails console
Loading development environment (Rails 7.0.8)
irb(main):001> article = Article.new
=> 
#<Article:0x0000ffff98a77ba8
...
irb(main):002> article
=> 
#<Article:0x0000ffff98a77ba8
 id: nil,
 title: nil,
 body: nil,
 published_at: nil,
 created_at: nil,
 updated_at: nil,
 excerpt: nil,
 location: nil>
irb(main):003> article.new_record?
=> true
irb(main):004> article.attributes
=> 
{"id"=>nil,
 "title"=>nil,
 "body"=>nil,
 "published_at"=>nil,
 "created_at"=>nil,
 "updated_at"=>nil,
 "excerpt"=>nil,
 "location"=>nil}
irb(main):005> article.title = "a title"
=> "a title"
irb(main):006> article.attributes
=> 
{"id"=>nil,
 "title"=>"a title",
 "body"=>nil,
 "published_at"=>nil,
 "created_at"=>nil,
 "updated_at"=>nil,
 "excerpt"=>nil,
 "location"=>nil}
irb(main):007> article
=> 
#<Article:0x0000ffff98a77ba8
 id: nil,
 title: "a title",
 body: nil,
 published_at: nil,
 created_at: nil,
 updated_at: nil,
 excerpt: nil,
 location: nil>
irb(main):008> article.save
=> false
irb(main):009> atricle
(irb):9:in `<main>': undefined local variable or method `atricle' for main:Object (NameError)

atricle
^^^^^^^
Did you mean?  article
irb(main):010> article
=> 
#<Article:0x0000ffff98a77ba8
 id: nil,
 title: "a title",
 body: nil,
 published_at: nil,
 created_at: nil,
 updated_at: nil,
 excerpt: nil,
 location: nil>
irb(main):011> article.save
=> false
irb(main):012> article.body = "this issome body"
=> "this issome body"
irb(main):013> article.published_at = '2038-01-01'
=> "2038-01-01"
irb(main):014> article.save
  TRANSACTION (0.3ms)  begin transaction
  Article Create (1.7ms)  INSERT INTO "articles" ("title", "body", "published_at", "created_at", "updated_at", "excerpt", "location") VALUES (?, ?, ?, ?, ?, ?, ?)  [["title", "a title"], ["body", "this issome body"], ["published_at", "2038-01-01 00:00:00"], ["created_at", "2023-09-29 23:29:42.940979"], ["updated_at", "2023-09-29 23:29:42.940979"], ["excerpt", nil], ["location", nil]]
  TRANSACTION (9.5ms)  commit transaction
=> true
irb(main):015> Article.count
  Article Count (0.5ms)  SELECT COUNT(*) FROM "articles"
=> 1
irb(main):016> article.new_record?
=> false
irb(main):017> article.count
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activemodel-7.0.8/lib/active_model/attribute_methods.rb:450:in `method_missing': undefined method `count' for #<Article id: 1, title: "a title", body: "this issome body", published_at: "2038-01-01 00:00:00.000000000 +0000", created_at: "2023-09-29 23:29:42.940979000 +0000", updated_at: "2023-09-29 23:29:42.940979000 +0000", excerpt: nil, location: nil> (NoMethodError)
irb(main):018> Article.count
  Article Count (0.6ms)  SELECT COUNT(*) FROM "articles"
=> 1
irb(main):019> Article.create(title: "this is the secon title", body: "this is t
he body for the second title", published_at: '2033-01-1')
  TRANSACTION (0.2ms)  begin transaction
  Article Create (1.3ms)  INSERT INTO "articles" ("title", "body", "published_at", "created_at", "updated_at", "excerpt", "location") VALUES (?, ?, ?, ?, ?, ?, ?)  [["title", "this is the secon title"], ["body", "this is the body for the second title"], ["published_at", "2033-01-01 00:00:00"], ["created_at", "2023-09-30 00:12:30.069050"], ["updated_at", "2023-09-30 00:12:30.069050"], ["excerpt", nil], ["location", nil]]
  TRANSACTION (2.5ms)  commit transaction
=> 
#<Article:0x0000ffff93c26558
 id: 2,
 title: "this is the secon title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):020> Article.create(title: "this is the third title", body: "this is t
he body for the second title", published_at: '2033-01-1')
  TRANSACTION (0.2ms)  begin transaction
  Article Create (1.0ms)  INSERT INTO "articles" ("title", "body", "published_at", "created_at", "updated_at", "excerpt", "location") VALUES (?, ?, ?, ?, ?, ?, ?)  [["title", "this is the third title"], ["body", "this is the body for the second title"], ["published_at", "2033-01-01 00:00:00"], ["created_at", "2023-09-30 00:12:48.076155"], ["updated_at", "2023-09-30 00:12:48.076155"], ["excerpt", nil], ["location", nil]]
  TRANSACTION (3.6ms)  commit transaction
=> 
#<Article:0x0000ffff93afa008
 id: 3,
 title: "this is the third title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):021> Article.create(title: "this is the 4th title", body: "this is the
 body for the second title", published_at: '2033-01-1')
  TRANSACTION (0.2ms)  begin transaction
  Article Create (1.4ms)  INSERT INTO "articles" ("title", "body", "published_at", "created_at", "updated_at", "excerpt", "location") VALUES (?, ?, ?, ?, ?, ?, ?)  [["title", "this is the 4th title"], ["body", "this is the body for the second title"], ["published_at", "2033-01-01 00:00:00"], ["created_at", "2023-09-30 00:12:56.799532"], ["updated_at", "2023-09-30 00:12:56.799532"], ["excerpt", nil], ["location", nil]]
  TRANSACTION (2.5ms)  commit transaction
=> 
#<Article:0x0000ffff93adbcc0
 id: 4,
 title: "this is the 4th title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):022> article.count
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activemodel-7.0.8/lib/active_model/attribute_methods.rb:450:in `method_missing': undefined method `count' for #<Article id: 1, title: "a title", body: "this issome body", published_at: "2038-01-01 00:00:00.000000000 +0000", created_at: "2023-09-29 23:29:42.940979000 +0000", updated_at: "2023-09-29 23:29:42.940979000 +0000", excerpt: nil, location: nil> (NoMethodError)
irb(main):023> Article.count
  Article Count (0.5ms)  SELECT COUNT(*) FROM "articles"
=> 4
irb(main):024> find(:2)
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/irb-1.8.1/lib/irb/workspace.rb:117:in `eval': (irb):24: syntax error, unexpected integer literal, expecting literal content or terminator or tSTRING_DBEG or tSTRING_DVAR (SyntaxError)
find(:2)
      ^

irb(main):025> find(2)
(irb):25:in `<main>': undefined method `find' for main:Object (NoMethodError)

find(2)
^^^^
irb(main):026> Atricle.find(2)
(irb):26:in `<main>': uninitialized constant Atricle (NameError)

Atricle.find(2)
^^^^^^^
Did you mean?  Article
irb(main):027> Atricles.find(2)
(irb):27:in `<main>': uninitialized constant Atricles (NameError)

Atricles.find(2)
^^^^^^^^
Did you mean?  Article
irb(main):028> Article.find(3)
  Article Load (0.5ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
=> 
#<Article:0x0000ffff93b77f80
 id: 3,
 title: "this is the third title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):029> Article.all
  Article Load (0.8ms)  SELECT "articles".* FROM "articles"
=> 
[#<Article:0x0000ffff93cfca90
  id: 1,
  title: "a title",
  body: "this issome body",
  published_at: Fri, 01 Jan 2038 00:00:00.000000000 UTC +00:00,
  created_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
  updated_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
  excerpt: nil,
  location: nil>,
 #<Article:0x0000ffff93cfc950
  id: 2,
  title: "this is the secon title",
  body: "this is the body for the second title",
  published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
  created_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
  updated_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
  excerpt: nil,
  location: nil>,
 #<Article:0x0000ffff93cfc810
  id: 3,
  title: "this is the third title",
  body: "this is the body for the second title",
  published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
  created_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
  updated_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
  excerpt: nil,
  location: nil>,
 #<Article:0x0000ffff93cfc6d0
  id: 4,
  title: "this is the 4th title",
  body: "this is the body for the second title",
  published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
  created_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
  updated_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
  excerpt: nil,
  location: nil>]
irb(main):030> Articles.first.title
(irb):30:in `<main>': uninitialized constant Articles (NameError)

Articles.first.title
^^^^^^^^
irb(main):031> Article.first.title
  Article Load (0.6ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."id" ASC LIMIT ?  [["LIMIT", 1]]
=> "a title"
irb(main):032> articles = Ariticle.all
(irb):32:in `<main>': uninitialized constant Ariticle (NameError)

articles = Ariticle.all
           ^^^^^^^^
Did you mean?  Article
irb(main):033> articles = Article.all
  Article Load (0.4ms)  SELECT "articles".* FROM "articles"
=> 
[#<Article:0x0000ffff93a99898
...
irb(main):034> articles.first.title
=> "a title"
irb(main):035> Article.where(title: "a title")
  Article Load (0.7ms)  SELECT "articles".* FROM "articles" WHERE "articles"."title" = ?  [["title", "a title"]]
=> 
[#<Article:0x0000ffff93a84240
  id: 1,
  title: "a title",
  body: "this issome body",
  published_at: Fri, 01 Jan 2038 00:00:00.000000000 UTC +00:00,
  created_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
  updated_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
  excerpt: nil,
  location: nil>]
irb(main):036> article = Article.first
  Article Load (0.4ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."id" ASC LIMIT ?  [["LIMIT", 1]]
=> 
#<Article:0x0000ffff93b776c0
...
irb(main):037> article.update_attributes(title: "updated title", published_at: 1
.day.ago)
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activemodel-7.0.8/lib/active_model/attribute_methods.rb:450:in `method_missing': undefined method `update_attributes' for #<Article id: 1, title: "a title", body: "this issome body", published_at: "2038-01-01 00:00:00.000000000 +0000", created_at: "2023-09-29 23:29:42.940979000 +0000", updated_at: "2023-09-29 23:29:42.940979000 +0000", excerpt: nil, location: nil> (NoMethodError)
Did you mean?  update_attribute
irb(main):038> article.update_attributes(title: "updated title", published_at: T
ime.zone.now )
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activemodel-7.0.8/lib/active_model/attribute_methods.rb:450:in `method_missing': undefined method `update_attributes' for #<Article id: 1, title: "a title", body: "this issome body", published_at: "2038-01-01 00:00:00.000000000 +0000", created_at: "2023-09-29 23:29:42.940979000 +0000", updated_at: "2023-09-29 23:29:42.940979000 +0000", excerpt: nil, location: nil> (NoMethodError)
Did you mean?  update_attribute
irb(main):039> article.update_attribute(title: "updated title", published_at: Ti
me.zone.now )
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activerecord-7.0.8/lib/active_record/persistence.rb:755:in `update_attribute': wrong number of arguments (given 1, expected 2) (ArgumentError)

me.zone.now
irb(main):041*   
irb(main):042*   
irb(main):043*   
irb(main):044*   
irb(main):045> end
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/irb-1.8.1/lib/irb/workspace.rb:117:in `eval': (irb):45: syntax error, unexpected `end', expecting ')' (SyntaxError)
irb(main):046> article.update_attribute(title: "updated title", published_at: Time.zone.now)
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activerecord-7.0.8/lib/active_record/persistence.rb:755:in `update_attribute': wrong number of arguments (given 1, expected 2) (ArgumentError)
irb(main):047> article.update_attributes(title: "updated title", published_at: Time.zone.now)
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activemodel-7.0.8/lib/active_model/attribute_methods.rb:450:in `method_missing': undefined method `update_attributes' for #<Article id: 1, title: "a title", body: "this issome body", published_at: "2038-01-01 00:00:00.000000000 +0000", created_at: "2023-09-29 23:29:42.940979000 +0000", updated_at: "2023-09-29 23:29:42.940979000 +0000", excerpt: nil, location: nil> (NoMethodError)
Did you mean?  update_attribute
irb(main):048> article.update(title: "updated title", published_at: Time.zone.now)
  TRANSACTION (0.2ms)  begin transaction
  Article Update (0.9ms)  UPDATE "articles" SET "title" = ?, "published_at" = ?, "updated_at" = ? WHERE "articles"."id" = ?  [["title", "updated title"], ["published_at", "2023-09-30 00:29:29.055081"], ["updated_at", "2023-09-30 00:29:29.055949"], ["id", 1]]
  TRANSACTION (2.7ms)  commit transaction
=> true
irb(main):049> article
=> 
#<Article:0x0000ffff93b776c0
 id: 1,
 title: "updated title",
 body: "this issome body",
 published_at: Sat, 30 Sep 2023 00:29:29.055081000 UTC +00:00,
 created_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:29:29.055949000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):050> Atricle.first
(irb):50:in `<main>': uninitialized constant Atricle (NameError)

Atricle.first
^^^^^^^
Did you mean?  Article
irb(main):051> Article.first
  Article Load (0.7ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."id" ASC LIMIT ?  [["LIMIT", 1]]
=> 
#<Article:0x0000ffff93adcf80
 id: 1,
 title: "updated title",
 body: "this issome body",
 published_at: Sat, 30 Sep 2023 00:29:29.055081000 UTC +00:00,
 created_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:29:29.055949000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):052> Article[2]
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activerecord-7.0.8/lib/active_record/dynamic_matchers.rb:22:in `method_missing': undefined method `[]' for Article:Class (NoMethodError)
irb(main):053> Article(2)
(irb):53:in `<main>': undefined method `Article' for main:Object (NoMethodError)

Article(2)
^^^^^^^
irb(main):054> Article.find(2)
  Article Load (0.4ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
=> 
#<Article:0x0000ffff93c37e48
 id: 2,
 title: "this is the secon title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):055> time.zone.now
(irb):55:in `<main>': undefined local variable or method `time' for main:Object (NameError)

time.zone.now
^^^^
irb(main):056> article.update(title: "updated title", published_at: "12-01-01")
  TRANSACTION (0.2ms)  begin transaction
  Article Update (1.0ms)  UPDATE "articles" SET "published_at" = ?, "updated_at" = ? WHERE "articles"."id" = ?  [["published_at", "0012-01-01 00:00:00"], ["updated_at", "2023-09-30 00:32:35.695701"], ["id", 1]]
  TRANSACTION (301.3ms)  commit transaction
=> true
irb(main):057> Article.find(2)
  Article Load (0.4ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
=> 
#<Article:0x0000ffff93cfc310
 id: 2,
 title: "this is the secon title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):058> Article.find(1)
  Article Load (0.7ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> 
#<Article:0x0000ffff93cf3490
 id: 1,
 title: "updated title",
 body: "this issome body",
 published_at: Sun, 01 Jan 0012 00:00:00.000000000 UTC +00:00,
 created_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:32:35.695701000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):059> article = Article.last
  Article Load (0.8ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> 
#<Article:0x0000ffff93cfb190
...
irb(main):060> article.destroy
  TRANSACTION (0.2ms)  begin transaction
  Article Destroy (0.9ms)  DELETE FROM "articles" WHERE "articles"."id" = ?  [["id", 4]]
  TRANSACTION (3.0ms)  commit transaction
=> 
#<Article:0x0000ffff93cfb190
 id: 4,
 title: "this is the 4th title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):061> article.destroy
=> 
#<Article:0x0000ffff93cfb190
 id: 4,
 title: "this is the 4th title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):062> article.destroy
=> 
#<Article:0x0000ffff93cfb190
 id: 4,
 title: "this is the 4th title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):063> article
=> 
#<Article:0x0000ffff93cfb190
 id: 4,
 title: "this is the 4th title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):064> article.destroy
=> 
#<Article:0x0000ffff93cfb190
 id: 4,
 title: "this is the 4th title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:56.799532000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):065> Article(4)
(irb):65:in `<main>': undefined method `Article' for main:Object (NoMethodError)

Article(4)
^^^^^^^
irb(main):066> Article.find(4)
  Article Load (0.4ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" = ? LIMIT ?  [["id", 4], ["LIMIT", 1]]
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activerecord-7.0.8/lib/active_record/core.rb:284:in `find': Couldn't find Article with 'id'=4 (ActiveRecord::RecordNotFound)
irb(main):067> Article.find(3)
  Article Load (0.7ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
=> 
#<Article:0x0000ffff93c32a88
 id: 3,
 title: "this is the third title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):068> Article.size
/home/david/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activerecord-7.0.8/lib/active_record/dynamic_matchers.rb:22:in `method_missing': undefined method `size' for Article:Class (NoMethodError)
irb(main):069> Article.all
  Article Load (0.5ms)  SELECT "articles".* FROM "articles"
=> 
[#<Article:0x0000ffff93abbf60
  id: 1,
  title: "updated title",
  body: "this issome body",
  published_at: Sun, 01 Jan 0012 00:00:00.000000000 UTC +00:00,
  created_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
  updated_at: Sat, 30 Sep 2023 00:32:35.695701000 UTC +00:00,
  excerpt: nil,
  location: nil>,
 #<Article:0x0000ffff93abbe20
  id: 2,
  title: "this is the secon title",
  body: "this is the body for the second title",
  published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
  created_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
  updated_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
  excerpt: nil,
  location: nil>,
 #<Article:0x0000ffff93abbce0
  id: 3,
  title: "this is the third title",
  body: "this is the body for the second title",
  published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
  created_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
  updated_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
  excerpt: nil,
  location: nil>]
irb(main):070> Article.last.destroy
  Article Load (0.7ms)  SELECT "articles".* FROM "articles" ORDER BY "articles"."id" DESC LIMIT ?  [["LIMIT", 1]]
  TRANSACTION (0.2ms)  begin transaction
  Article Destroy (1.1ms)  DELETE FROM "articles" WHERE "articles"."id" = ?  [["id", 3]]
  TRANSACTION (284.1ms)  commit transaction
=> 
#<Article:0x0000ffff93cf7590
 id: 3,
 title: "this is the third title",
 body: "this is the body for the second title",
 published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
 created_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:12:48.076155000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):071> Article.all
  Article Load (0.4ms)  SELECT "articles".* FROM "articles"
=> 
[#<Article:0x0000ffff93cfc090
  id: 1,
  title: "updated title",
  body: "this issome body",
  published_at: Sun, 01 Jan 0012 00:00:00.000000000 UTC +00:00,
  created_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
  updated_at: Sat, 30 Sep 2023 00:32:35.695701000 UTC +00:00,
  excerpt: nil,
  location: nil>,
 #<Article:0x0000ffff93cfbf50
  id: 2,
  title: "this is the secon title",
  body: "this is the body for the second title",
  published_at: Sat, 01 Jan 2033 00:00:00.000000000 UTC +00:00,
  created_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
  updated_at: Sat, 30 Sep 2023 00:12:30.069050000 UTC +00:00,
  excerpt: nil,
  location: nil>]
irb(main):072> exit

david@pi:~/Desktop/Code/rails/blog$ rails help
The most common rails commands are:
 generate     Generate new code (short-cut alias: "g")
 console      Start the Rails console (short-cut alias: "c")
 server       Start the Rails server (short-cut alias: "s")
 test         Run tests except system tests (short-cut alias: "t")
 test:system  Run system tests
 dbconsole    Start a console for the database specified in config/database.yml
              (short-cut alias: "db")
 new          Create a new Rails application. "rails new my_app" creates a
              new application called MyApp in "./my_app"
 plugin new   Create a new Rails railtie or engine

All commands can be run with -h (or --help) for more information.
In addition to those commands, there are:

  about
  action_mailbox:ingress:exim
  action_mailbox:ingress:postfix
  action_mailbox:ingress:qmail
  action_mailbox:install
  action_mailbox:install:migrations
  action_text:install
  action_text:install:migrations
  active_storage:install
  app:template
  app:update
  assets:clean[keep]
  assets:clobber
  assets:environment
  assets:precompile
  cache_digests:dependencies
  cache_digests:nested_dependencies
  credentials:diff
  credentials:edit
  credentials:show
  db:create
  db:drop
  db:encryption:init
  db:environment:set
  db:fixtures:load
  db:migrate
  db:migrate:down
  db:migrate:redo
  db:migrate:status
  db:migrate:up
  db:prepare
  db:reset
  db:rollback
  db:schema:cache:clear
  db:schema:cache:dump
  db:schema:dump
  db:schema:load
  db:seed
  db:seed:replant
  db:setup
  db:system:change
  db:version
  destroy
  dev:cache
  encrypted:edit
  encrypted:show
  importmap:install
  initializers
  log:clear
  middleware
  notes
  restart
  routes
  runner
  secret
  secrets:edit
  secrets:setup
  secrets:show
  stats
  stimulus:install
  stimulus:install:importmap
  stimulus:install:node
  test:all
  test:db
  time:zones[country_or_offset]
  tmp:clear
  tmp:create
  turbo:install
  turbo:install:importmap
  turbo:install:node
  turbo:install:redis
  version
  yarn:install
  zeitwerk:check
david@pi:~/Desktop/Code/rails/blog$ rails console
Loading development environment (Rails 7.0.8)
irb(main):001> Article.find(1)
  Article Load (0.7ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> 
#<Article:0x0000ffff7ae0f680
 id: 1,
 title: "updated title",
 body: "this issome body",
 published_at: Sun, 01 Jan 0012 00:00:00.000000000 UTC +00:00,
 created_at: Fri, 29 Sep 2023 23:29:42.940979000 UTC +00:00,
 updated_at: Sat, 30 Sep 2023 00:32:35.695701000 UTC +00:00,
 excerpt: nil,
 location: nil>
irb(main):002> exit
david@pi:~/Desktop/Code/rails/blog$ 

