
Charti.st
=========== 
[![Code Climate](https://codeclimate.com/github/chartist/chartist.png)](https://codeclimate.com/github/chartist/chartist)

## Data visualization on the go

![](app/assets/images/landing-page.png)

This project was built as our final submission for **[Makers Academy](http://www.makersacademy.com/)**. Chartist is a web application that provides a friendly and fast way to share data in the form of javascript charts built on top of Google Charts API.

User can create charts using CSV or Excel files or entering the data manually into a Javascript spreadsheets. Charts are created on the fly. We put a lot of effort into making the chart creation process as sleek and as fast as possible, stripping out all but the absolutely necessary options. Users can then share charts, embed them on their blog, download as a picture or a CSV.

Users can create multiple dashboards by topic subject. For the moment dashboards are public (i.e. anyone can contribute to any dashboard) but it would be easy to restrict access in the future. On dashboards users can drag and drop charts to built a perfect arrangement.

We paid a lot of attention to the database design and modularity of the data processing to make sure the app is as flexible as possible. Using the current structure it would be easy to add features such as Google Spreadsheet input, combining of charts and dynamic charting.

### The stack

* Ruby on Rails
* TDD with RSpec & FactoryGirl
* BDD with Capybara
* PostgreSQL
* External libraries: Chartkick, Google Charts API, Devise, Omniauth, Chronic, Roo, Paperclip, Zeroclipboard, Sendgrid, Gravatar, AddThis
* JavaScript, jQuery, Angular.js, Handsontable.js, Gridster.js, Typeahead.js
* HTML5 & CSS3 using Twitter Boostrap
* Heroku deployment([http://charti.st](link))

### The API

* Every chart is available in JSON format which we ourselves use to build charts. Just add .json to any chart link. ([example](http://charti.st/charts/96-abstract.json))

### Our process

During the 2 weeks we followed agile methodologies to ship code early and fast. We strongly believe in continuous deployment and fast prototyping.

We begin each day with a short 15-min stand-up meeting to assess the day's goals and then split for the rest of the day to work on several issues while keeping some extra time on the day to fix issues as they arise. We also pair on the more interesting features.

Our final project presented a learning opportunity for all of us, so we decided to pair on the most challenging features, like developing the **[Chart Feature](https://github.com/chartist/chartist/blob/master/app/models/chart.rb)**
with a proper test-suite that covered **[integration-testing](https://github.com/chartist/chartist/blob/master/spec/features/chart_feature_spec.rb)**, **[unit-testing](https://github.com/chartist/chartist/blob/master/spec/models/chart_spec.rb)**
and **[requests](https://github.com/chartist/chartist/blob/master/spec/requests/chart_request_spec.rb)**.

### What's next
As this was a 2-week project we focused on building the core funtionality. However, we belive there is a lot of potential to extend the project by implementing in-chart annotations, Google Spreadsheets integration, inbound API (building a chart from JSON messages) etc.

### The team

Chartist was well crafted with ♥ by

* [Mario Gintili](https://github.com/mariogintili)
* [Mikhail Dubov](https://github.com/duboff)
* [Toby Retallick](https://github.com/TobyRet)
* [Anna Yanova](https://github.com/yan0va)
* [Natascia Marchese](https://github.com/itsmurasaki)

### Notes

Please note, 3-rd party login is currently in test-mode and therefore only works for the developers of the app. Use normal sign up if you want to see all the features.
