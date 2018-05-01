# Hendrick IT (HIT)

Simple platform for showcasing HIT. Acts as Marketing and Information Directory

## Modeling Ideas

Here are some rules around Users, Posts and the like:

**Quick aside regarding tags**: The `[tags]` engine of choice is [gutentag](https://github.com/pat/gutentag#installation). The main resources (`Users` and `Posts` ... `Departments`?) will have tags assciated with them. This helps the user find answers across resources by keyword.

### Users
````
user: {
  name,
  email,
  title,
  department,
  bio,
  photo_url,
  [tags]
}
````

User Roles:

- `executive`
- `manager`
- `author`

#### Executive
The `executive` privilage can post to any / all departments and has the access to all `post types`.

#### Manager
The `manager` privilage can post to their department and has the access to all `post types`.

#### Author
The `author` privilage can post to their department and has the access to a few `post types`.

### Posts
````
post: {
  title,
  something,
  description,
  department,
  type,
  image,
  [tags]
}
````

Post Types:

- `Announcements`
- `FAQ`
- `How-to`
- `Links / Forms`
- `Department News`


### Departments
````
department: {
  department_name,
  [tags]
}
````


## 3rd Party

- [gutentag](https://github.com/pat/gutentag#installation)
- [cancan](https://github.com/ryanb/cancan)
- [faker](https://github.com/stympy/faker)
- [webpacker](https://github.com/rails/webpacker)
- [react-rails](https://github.com/reactjs/react-rails)
- [react-tagsinput](https://github.com/olahol/react-tagsinput)
- [react-autosuggest](https://github.com/moroshko/react-autosuggest)
- [react-reveal](https://github.com/rnosov/react-reveal)
- [bootstraptour](http://bootstraptour.com/)
- [react-draft-wysiwyg](https://github.com/jpuri/react-draft-wysiwyg)

