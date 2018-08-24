express     = require 'express'
request     = require 'request'
MongoClient = require('mongodb').MongoClient
_           = require 'lodash'

url = 'mongodb://localhost:27017/'

Addition    = require './Addition'
localTutor  = require './NodeTutorial'

console.log Addition.AddNumber 1, 2

localTutor.NodeTutorial()

app = express()

request 'https://www.google.com/', (err, res, body) ->
  # console.log body

app.set 'view engine', 'pug'

app.get '/', (req, res) ->

  data =
    title: 'Node'
    message: 'Hello'

  res.render 'index', data: data

app.get '/Employee', (req, res) ->
  str = ''

  MongoClient.connect url, (err, db) =>

    db = db.db 'EmployeeDB'
    db.collection('Employee').find().toArray (err, results) =>


      _.each results, (c) ->
        if c != null
          str = str + c._id

      res.send str





server = app.listen 3000, () ->
  console.log 'Start Server!'