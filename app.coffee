express = require 'express'

app = express()

app.set 'view engine', 'pug'

app.get '/', (req, res) ->


server = app.listen 3000, () ->
  console.log 'Start Server!'