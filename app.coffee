express     = require 'express'
request     = require 'request'
BlueBird    = require 'bluebird'
MongoClient = BlueBird.promisifyAll(require('mongodb')).MongoClient
_           = require 'lodash'

url = 'mongodb://localhost:27017/EmployeeDB'

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

  MongoClient.connectAsync(url)
    .then (db) =>
      db = db.db 'EmployeeDB'
      insertData =
        name: 'OK'
      db.collection('Employee').insertOne(insertData)
        .then (result) =>
          db.collection('Employee').find({}).toArrayAsync().then (results) =>
            _.each results, (c) ->
              console.log c
              if c != null
                str = str + c._id
            res.send str





server = app.listen 3000, () ->
  console.log 'Start Server!'