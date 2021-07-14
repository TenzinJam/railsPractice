git push --set-upstream origin master

bin/rails new Nile --api ----- to create a new project

bin/rails routes --- for creating routes

bin/rails s ---for creating developer server


bin/rails g controller BooksController index --- for creating a controller (these are called rails scaffold)

rails g model Book title:string author:string ---for defining a model (In this case "bin/" seems to be optional)


what is running a migration?  (bin/rails db:migrate)

to activate rails console: bin/rails c

Book.create!(author:"Tenzin", title: "Rails Api") --- how you can manually seed the database. This code is written in the rails console.

[] Still not sure what controllers are and what actions are.

[] how did Surf define statefull and stateless?

[] status codes: 201 - created, unprocessable entity - 422 (request was received but the parameter is invalid), 200 - ok, 204 - No Content (nothing to return after deletion), 301 - redirect(Moved Permanently), 400 - Bad Request, 401 - Unauthorized, 404 - Not Found, 500 - Internal Server Error

[] validates method in book's model is where you define the database and define what values are allowed and not
[] Active Record validation
[] new vs create . If you want to check whether a request is bad or not, it is better to use new than create.
[] exception handlings
[] what is ActiveRecord?
[] rescue-from syntax
[] namespacing and versioning
[] gem file
[] gem 'rspec-rails' for installing testing tools
[] rails generate rspec:install
[] rspec doesnt run the test. I had to add the relative file path after the rspec command to be successfulyl run it. Not sure why?
[] what are factories?
[] bundle command whenever you install a gem
[] you can write for individual "actions" in the controller
[] model associations
[] bin/rails g migration add_author_to_books author:references  --- for creating associations and relationships
[] It is confusing what the console is doing. It is clearly not posting data into the database.
[] bang (!) is useful when you are trying to handle errors.
[] Controller Representer --- what's the point of this?
For example, BookRepresenter is used as a class with methods so that we can define and specify how we word our json file that is being returned.



[]Book.select
[] Book.select { |book| book.author_id.nil? }.map(&:destroy)
[] Book.select { |book| book.author_id.nil? }.count
[] binding.irb     what is that?
[] TDD: to start by running the test and see what we are failing before we try to anticipate what the bugs and new changes we need to bring to our code base.


[] What are assertions?
[]let(:second_author) { FactoryBot.create(:author, first_name: 'H.G.', last_name:'Welss', age:70)}  --- how you assign values to variables.

[] what is type?
[] pagination in rails: The whole point of pagination is to stop returning thousands of results.
    - limit is how we choose the size of the result set
    - offset is how we page through them

[] to_i string method
[] [num1, num2].min (or .max) method in Ruby
[] What is Active Job? I am skipping this video (no 16) and the testing for this (no 17). I can come back to it.
[] JSON web token _ JWT  jwt.io


[] Scheme: routes -> controller -> specs

[]rescue_from   -> what is this syntax?

[] what is a service?

[] authentication through JWT and it's testing seems replicable. Need to dig deeper.

[] hmac secret in the tutorial is in a file that will eventually get pushed to the github? Do we not save that as an environment variable and add that to our git ignore?

[]bin/rails g model User username:string - another example of creating a model. This script generates a migration the link to which will be in your console

[] follow the above script by this ---> bin/rails db:migrate
[] You need to build the relationship between authentication and authentication token service
[] What is an Active Record?

[] Active Record method - such as has_secure_password

[]what is the difference between: rails and bin/rails command. They seem to be doing the same thing

[] Questions regarding factories in spec file. We are creating a book.rb and a user.rb, but we are not creating an author one? Because I see it in books_specs that we are using Factory bots to create authors.

[] raise error unless user.authenticate(params.require(:password))  --- bunch of new syntax here, but authenticate method is provided by the has_secure_password

[] print syntax in Ruby: p params.require(:password).inspect

[] @user ||= User.find_by(username: params.require(:username)) ---- another interesting syntax

[] after you install the bcrypt (by adding that into your Gem file and running bundle), you need to restart your server


[] tokens_and_options method

[] what's the raise syntax for?

FROM FREECODE CAMP rails tutorial: FEW IMPORTANT NOTES:
  erb stands for embedded ruby



- Gem file: add third party things
- Rails is an MVC architecture:
    1) Models are database (you can use any kind of database and swap out databases and nothing in your code changes because rails abstracts those away)
    2) Views are webpages: html
    3) Controllers: brains behind the scene.

- main folders in the ready made rails directory are:

1) app: assets, controllers, models, views
2) config: routes.rb
3) database: migration(I think the migration files disappear once you have migrated them to the database) and schema
4) specs:

- CRUD scaffold in Rails
 1) rails g scaffold friends first_name:string, last_name:string, email:string, phone:string, twitter:string
 The above command will create a migration with the validations specified, it will also create corresponding models, controllers and views without having to create them individually.
 2) once you have created this table, look into the db/migrate folder and you will a new file created with the table definition
 3) rails db:migrate ---> this pushes the migration into the database
 4) After that the schema file will appear in your migrate folder.


- important commands:
    1) rails g
