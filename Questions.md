###What is delegation and why do iOS developers use it?
Delegation allows you to establish a class that handles responsibility
 that you cannot determine at the time you design your source class. It allows
classes and other types to hand off responsibility for providing data and
behavior. Delegator asks a question/notifies and delegate responds/confirms.

It's extremely helpful in passing information back-and-forth between views when
often one view doesn't know what it should do until the other view tells it
what to do.

###Why is a table view's data source a kind of delegation?
Because UITableViewDataSource delegate serves data to the UITableView, often
data from the app model. So the tableview is 'delegating' data tasks.

###And how does it differ from a table view's delegate?
The table view delegate is different from the table view data source
in that the table view delegate delegates user interaction with the
UITableView.

###Why use animation in the table when adding, removing, or reordering items?
Because it's awesome. Apple has given use some great animations that we can
use, instead of just loading the data. It can make your app stand out and
look production ready.

###Why use a model? Why not just update an array of items directly in your table?
Models are super helpful for separating the data from the view controller and
the view. The model is the one and only place where the controller goes
to get and mutate data and as such it can never be mutated without
going into the model and changing data. It's also helpful when you need to
switch out models and you don't want to completely muck up your code.

###When do you call reloadData? When don't you?
You call reloadData() when data in the model has changed. You would not call
reload data when you were just reading data. Furthermore, if you implement
a sweet UITableView method, then you would rely on that UITableView method
and would not call reloadData()
