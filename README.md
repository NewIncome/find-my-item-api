# API: Find Your Item
API with a DB where we can retrieve an item's info and favorite-item's list from a logged in User. Coded with Ruby on Rails following TDD practices.
Built according to [Microverse's requirements](https://www.notion.so/Final-Capstone-Project-Find-Your-House-9a424802e7dc48eb8ef40e2ac09397d1).

## Links
* [GitHub Repo](https://github.com/NewIncome/find-my-item-api)
* [:globe_with_meridians::computer: Heroku Livelink](https://findmyitem-api.herokuapp.com)
* [ERD with draw.io](https://app.diagrams.net/#W388c734d24bdc20a%2F388C734D24BDC20A!531)

## Built With 

- Ruby
- RAILS
- RSpec
- PostgreSQL

## Database ERD

<div style="text-align: center;">
<img src="app/assets/FinalCap ERD.png" alt="image" style="zoom: 33%;" />
</div>

## Getting Started

This APP uses PostgreSQL, so make sure you have it installed in your development and test environment. This could be changed in the `./config/database.yml` file if needed.

Also note that the database expects to have a specific user with a password (in `database.yml` file).

Feel free to create more entries in the `db/seeds.rd` file to generate more initial content.

To get started with the APP, clone [the repo :blue_book:](https://github.com/NewIncome/find-my-item-api) and then install the needed gems with:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Then, to seed moc data to the DB for interaction:

```
$ rails db:seed
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```


## Usage

For _example_, using [HTTPie](https://httpie.io/) you can (after runnign the API in your local server):

// The user and/or item to be worked with will go in the link with it's ID.

- Add a user
```
$ http POST :3000/users name="New User Name"
```
- See all Items
```
$ http :3000/items
```
- Add an Item
```
$ http POST :3000/items name="New Item Name" description="Item #1's description"
```
- Update an Item's info
```
$ http PUT :3000/items/1 description="New item #1 description"
```
- Delete an Item
```
$ http DELETE :3000/items/1
```
- See a User's Favorite List of Items
```
$ http :3000/users/3/favorites_lists
```
- Add an Item to a User's Favorite List
```
$ http POST :3000/users/3/favorites_lists item_id=1
```
- Delete an Item from a User's Favorite List
```
$ http DELETE :3000/users/3/favorites_lists item_id=1
```

## Improvements

Features pending to add to this app:
- add improved User info and login

## Author
👤 **Jose Alfredo Cardenas**

- Github: [@Jose Alfredo](https://github.com/NewIncome)
- Twitter: [@J_A_fredo](https://twitter.com/J_A_fredo)
- LinkedIn: [Jose Alfredo Cardenas](https://www.linkedin.com/in/j-alfredo-c/)  

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

If you got until here, show your love hitting the ⭐️ button, greatly appreciated.

## 📝 License

MIT
