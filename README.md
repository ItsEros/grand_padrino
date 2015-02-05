# Grand Padrino

### Installation

To install Grand Padrino, 

```bash
git clone git@github.com:bcgio/grand_padrino.git
cd grand_padrino

bundle install  # installs dependencies
rake sq:create  # creates the database
rake db:migrate # sets up tables
rake db:seed    # populates those tables
```

Once all of the above have done their jobs, you'll be able to run

```bash
padrino start
```

and direct your web browser on over to localhost:3000 to see Grand Padrino in action.

