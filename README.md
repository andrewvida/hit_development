# Hendrick IT (HIT)

Simple platform for showcasing HIT. Acts as Marketing and Information Directory

## Modeling Ideas

Here are some rules around Users, Posts and the like:

### Users
`user:{ name, email, department, type, [tags]}`

Types:

- `executive`
- `department_head`
- `author`

#### Executive
The `executive` privilage can post `announements` that are displayed on all `department` views. Example: `Hendrick IT offices will be closed Friday!`

#### Department Head
The `department_head` privilage can post `announements`, `stories`, `FAQs`, `resources` and `staff`. These posts are limitted to their `Department` views.

#### Author
The `author` privilage can post `stories`, `resources`, `staff`. These posts are limitted to their `Department` views.

### Posts
`post:{ title, description, department, type, image, [tags]}`

Types:

- `announcements`
- `story`
- `FAQ`
- `resource`
- `staff`

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

