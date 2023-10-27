# README

I. Shopping Cart Application

    This is a Shopping Application that displays a list of items available for purchase, allows a user to add items to their shopping cart, and then generates a receipt for their purchases with reward points calculated based on the transaction. Watch the video below for a demo of the app when it is used in interaction with a front-end interface.

    https://www.loom.com/share/3f0fb37b5bb64514bccf4316d472f971?sid=f4f83d13-9627-4470-83eb-f5430a6cd417

II. Set Up 

    * Install Ruby version 3.2.2 on your computer, and set the computer's default Ruby version to 3.2.2. Type 'rvm install "ruby-3.2.2"' and, when that is finished running, 'rvm --default use 3.2.2' into your terminal 

    * Install Rails version 6.0.6.1

    * Install sqlite3 if you do not have it already: https://www.sqlite.org/index.html

    * Open the application in your code editor and if Ruby version 3.2.2 is not in your path, type 'rvm use 3.2.2' in the terminal in the application's repo. You will know that version 3.2.2 is not in your path and that you are falling back to a different version of Ruby if you type 'ruby -v' in the terminal in the repo and it prints out a version lower than 3.2.2. 

    * Run rails db:migrate and rails db:seed

    * Start the server by typing 'rails server' in your terminal in the root directory of the repo and hitting enter.

III. Routes and Models

    There are a few models and routes that have been set up to generate receipts and calculate the points earned for any given receipt.

    * Items: The 'Item' model has attributes of 'short_description' and 'price'. Items can be linked to receipts through the 'Purchase' join table. The only route currently set up for the Items controller is '/items', and it renders an index of items as a JSON object. This allows a front-end application to fetch and then display the items available. 

    * Receipts: The 'Receipt' model has attributes of 'retailer' and 'total', and it can have items that belong to it through the 'Purchase' join table. There are two routes for the Receipts controller, a 'get' route at '/receipts/:receipt_id/points' and a 'post' route at '/receipts/process'. For now, both of these endpoints look to the same process method in the Receipts controller. If the params in the request include a receipt_id, then the user is looking to calculate the reward points that have been earned for that receipt. The controller makes that calculation and returns the number of points rendered as JSON. If the params do not include a receipt_id, then the user is looking to create a receipt, so the controller generates a receipt with items on it that are linked to it through the Purchase join table and renders a JSON object of the receipt id in response.

IV. Interactivity with a Front End Application

    A minimal front-end interface is built out in a separate app at https://github.com/automobileslie/grocery_store_application_front_end. If you clone that repo and get it up and running, you can test out the user experience as it makes fetches to the backend. The frontend displays the items available. It also allows users to add an item to their cart, complete the purchase, and see their reward points. 

