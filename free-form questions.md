## What is delegation and why do iOS developers use it?

Delegation helps provide actions on behalf of the view and model to enable them to iteract with each other.

// Thanks Sameera! 

## Why is a table view's data source a kind of delegation? And how does it differ from a table view's delegate?

The table view's delegate deals with the user's interaction with the UI, while the data source is communicating with the model to obtain data that the table itself doesn't contain.


## Why use animation in the table when adding, removing, or reordering items?

It provides a better end-user experience with a more native-looking app, with intuitive animations that are easy to expect and follow.


## Why use a model? Why not just update an array of items directly in your table?

So if I wanted to change the way that the app handles the data or present it different, I wouldn't have to seperate the wheat from the chaff by hand. 

## When do you call reloadData? When don't you?

You want to call reloadData when you make certain updates and have it reflect onto the app. You don't call reloadData when you are deleting items from your array or your cells when editing the list. 