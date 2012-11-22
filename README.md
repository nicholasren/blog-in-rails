###Introduction   
  This is a experiment blog application written in rails. 

###Coding rules
  + cucumber features are deprected, let's try to use rspec as 'functional test' and 'live document'.
  + must have rspec functional/unit tests.
  + page details, interactions should be encapsulated in page model. for more info, please refer [gizmo](https://github.com/icaruswings/gizmo)
  
###Run rspec in drb mode
by default, we will run rspec in drb mode.

  1. open a terminal, cd to project directory and run `spork`  
  2. open another terminal, cd to project directory and run `rspec spec/your_spec.rb`
