# README

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.1]
- Rails [6.0.3]

#### 1. Check out the repository

```bash
git clone https://github.com/waynedelcorraljr/teachers_pet.git
```

#### 2. Install dependencies

Run following command from /teachers_pet directory 

```bash
bundle install 
```

#### 3. Create and setup the database

Run the following command to create and setup the database. 

```bash
rake db:migrate
```

#### 4. Start the Rails server

You can start the rails server using the command given below.

```bash
rails s
```

And now you can visit the site with the URL http://localhost:3000
* ...
