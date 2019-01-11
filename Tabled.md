# Tabled

**What is delegation and why do iOS developers use it?**

Delegation is a simple and powerful pattern in which one object in a program acts on behalf of, or in coordination with, another object. The main value of delegation is that it allows you to easily customize the behavior of several objects in one central object. 

**Why is a table view's data source a kind of delegation? And how does it differ from a table view's delegate?**

The table view is the delegator, while the class that adopts/conforms to UITableViewDataSource (which is often a view controller) is the delegate. Serving as a table's delegate means you provide answers to requests about the layout of the table and about actions the user performs on the tableview. Serving as a table's datasource means you provide data for the sections and rows of a table and you act on messages that change a table's data.

**Why use animation in the table when adding, removing, or reordering items?**

Animations help the user confirm what actions are taking place.

**Why use a model? Why not just update an array of items directly in your table?**

We use a model to represent our data and give it structure. Doing so avoids what is known as "spaghetti code".

**When do you call reloadData? When don't you?**

The table view’s delegate or data source calls this method when it wants the table view to completely reload its data. It should not be called in the methods that insert or delete rows, especially within an animation block implemented with calls to beginUpdates() and endUpdates().
