**Setup**:

- models, migrations, validations, associations
- all necessary methods for manage user password_digest and session_token

**Auth_stuff**:
- user stuff (routes, actions and views for creating new user)
- sessions stuff (routes, actions and views for login and logout)
  - works with user model
- general helpers stuff ( current_user, log_in, log_out, require_login)
- errors and username, signin, signup, signout button in application.html.erb - so its on every page.

All above should be the same or almost the same on the real assessment.
Its general pattern that we did all this week.

**Other stuff**:

All controllers and views for CRUD are super similar. Differs only in
naming and instance variables (columns). So u can basically copy-paste
most of them. 

**Think what action and routes u might need. Check docs, specs, common sense.**

1. **create routes** - don’t nest until u need, create all routes if not sure.
2. **create actions**
    a. **#model_params** - helper method for params for current model object.
    b. **#index** - render view with all objects
    c. **#show** - render view with current object (id from params)
    d. **#new** - render view with new object
    e. **#edit** - render view with current object (id from params)
    f. **#update** - post action with logic for #edit (gets data from params)
        1. if updates attributes successfully -> goes to #show
        2. if not -> render back #edit and shows errors
    g. **#create** - post action with logic for #new (gets data from params)
        1. creates new object and set all data
        2. if saves successfully -> goes to #show
        3. if not -> render back #new and shows errors
    8. **#destroy** - delete action, destroy object from DB and redirect to #index or parent #show.
3. **create views**
    1. dont forget for **authenticity token** for forms!
    2. **Copy -> Paste -> Edit forms!**
    3. **#new**
        1. title
        2. form (**#create route**) with input elements for every needed to be filled column
    4. **#edit**
        1. title
        2. form (**#update route**), add **hidden input for \_method update**. other should be almost the same as #new
    5. **#show**
        1. display all fields
        2. link to #edit
        3. link to #destroy (sometimes)
        4. any specific things ( render child objects, link to create new child object etc.)
    6. **#index**
        1. render all objects as list of links
        2. link to #new
