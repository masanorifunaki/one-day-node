express = require 'express'

Addition = require './Addition'
localTutor = require './NodeTutorial'

console.log Addition.AddNumber 1, 2

localTutor.NodeTutorial()

app = express()

app.set 'view engine', 'pug'

app.get '/', (req, res) ->


server = app.listen 3000, () ->
  console.log 'Start Server!'