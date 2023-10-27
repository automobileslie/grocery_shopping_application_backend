# README

I. Shopping Cart Application

    This is a Shopping Application that:
    * displays a list of items available for purchase
    * allows a user to add items to their shopping cart, 
    * generates a receipt for their purchases 
    * and calculates their reward points 
    
    Watch the video below for a demo.
   <a href="https://www.loom.com/share/3f0fb37b5bb64514bccf4316d472f971?sid=f4f83d13-9627-4470-83eb-f5430a6cd417">Application Demo</a>

II. Set Up 

    * Install Ruby version 3.2.2: 'rvm install "ruby-3.2.2"'
    * Set the computer's default with: 'rvm --default use 3.2.2'
    * Install Rails version 6.0.6.1
    * Install sqlite3: https://www.sqlite.org/index.html
    * Go to the root of the application
    * Type 'ruby -v' in the terminal
    * If it is less than 3.2.2, enter 'rvm use 3.2.2'
    * Run rails db:migrate and rails db:seed
    * Enter 'rails server' to start the server

III. Routes and Models

    * Items: 
        - Has attributes of 'short_description' and 'price'. 
        - Can belong to receipts through the 'Purchase' join table. 
        - Items controller route '/items' renders an index of items.

    * Receipts: 
        - Has attributes of 'retailer' and 'total'
        - Can have items belonging to it through the 'Purchase' join table. 
        - There is a 'get' route at '/receipts/:receipt_id/points' 
        - There is a 'post' route at '/receipts/process'. 
        - These go to the process method in the Receipts controller. 
        - If the params include a receipt_id, we calculate and return points.
        - Otherwise, the controller generates a receipt and returns a receipt id.

IV. Interactivity with a Front End Application

<a href="https://github.com/automobileslie/grocery_store_application_front_endfront-end">This Front End Application</a> is built out for demo purposes. 
If you clone that repo and get it up and running, 
you can test out the user experience as it makes fetches to the backend. 
The frontend displays the items available. 
It also allows users to add an item to their cart, complete the purchase, and see their reward points. 

