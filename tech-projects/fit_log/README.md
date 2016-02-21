# FitLog

FitLog is a basic application built using Rails to log fitness activity on a calendar. Includes
posting workouts and following users to see each others workouts on a feed. I created this application 
primarily to teach myself so basic Rails, and because I kept forgetting when I last worked out a 
muscle group at the gym and how much weight I was repping for specific exercises.

Previous iteration of this project was built using Flask and included a pointless point system (heh)
with weekly and overall leaderboards which can be found [here.](https://github.com/bryanyan/fitpts)

## Installation: How to run on your own local machine
Make sure you have Rails installed. First, clone this repo and cd into the fit_log directory.
Install the correct packages. 

```
$ git clone https://github.com/bryanyan/clarifai-champs.git
$ cd clarifai-champs/tech-projects/fit_log
$ bundle install
$ bundle exec rake db:migrate 
$ rails server
```
Now navigate to http://localhost:3000 or wherever your port is and have fun!


## Resources

Ruby on Rails Tutorial: This application was built heavily following the online version
of the Ruby on Rails Tutorial 3rd edition by Michael Hartl.
The tutorial can be found [here.](https://www.railstutorial.org/book/beginning#cha-beginning)

## TODO
* STYLING ON EVERYTHING!!!
* Editing workouts
* Pages for sort workout by tag
