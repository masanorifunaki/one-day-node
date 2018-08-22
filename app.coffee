express = require 'express'

Addition = require './Addition'

console.log Addition.AddNumber 1, 2

app = express()

app.set 'view engine', 'pug'

app.get '/', (req, res) ->


server = app.listen 3000, () ->
  console.log 'Start Server!'