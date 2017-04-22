# Reddit Feels

A command line application to play word association with a database of reddit comments.

## Video Demo

[![VIDEO](https://img.youtube.com/vi/pITLn_YlGUU/0.jpg)](https://www.youtube.com/watch?v=zrgjvtpyZwk)

Click [here](https://www.youtube.com/watch?v=zrgjvtpyZwk) to view the application running!

This version has been modified to deal with the first and last month of Barack Obamas time in office, but could easily be changed to other scenarios.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Prerequisites

The image rendering is done via "catpix" gem, see this site for a further guide in setting it up: http://radek.io/2015/06/29/catpix/

The application also requires a number of gems for text formatting. Remember to bundle install before running.

```
bundle install
```

### Installing

Here's the step by step guide to getting the database created on your local machine.

##### Step 1: Adding your raw data
Download your raw reddit data in JSON format and place it in the "db/reddit-json" folder

##### Step 2: Selecting the specific dates to analyze
Make sure the UTC date ranges in the "bin/run" file match the date ranges of your chosen reddit comments.

##### Step 3: Creating your database
In your terminal migrate the database...
```
rake db:migrate
```
...then seed your database with your reddit data. (This may take a while, depending how big your data files are)
```
rake db:seed
```
##### Step 4: Run!
Run your application and you should be prompted to enter the word you'd like to associate with!
```
ruby bin/run.rb
```
![N](https://s2.postimg.org/awuz5wd6h/Screen_Shot_2017-04-21_at_13.20.00.png)

## Authors

 See the list of [contributors](https://github.com/jonathanandrewsuk/reddit-feels/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License

## Acknowledgments

* Obama for all his great work that impacts this app
* redditors, we salute you
