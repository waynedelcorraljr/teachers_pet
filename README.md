# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
~ ruby 2.6.1

* Rails version
~ rails 6.0.3

* Deployment instructions
The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.1]
- Rails [6.0.3]

##### 1. Check out the repository

```bash
git clone https://github.com/waynedelcorraljr/teachers_pet.git
```

##### 2. Install dependencies

Run following command from /teachers_pet directory 

```bash
bundle install 
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```bash
rake db:migrate

rake db:seed
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```bash
rails s
```

And now you can visit the site with the URL http://localhost:3000
* ...
