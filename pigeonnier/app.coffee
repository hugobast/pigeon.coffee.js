models = require './data/store'
express = require 'express'
form = require 'connect-form'
app = module.exports = express.createServer()
Post = models.Post

# Configuration

app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session
    secret: 'sada97sdasf86sa6as68s6a8s7d6877tafg12jh1987'
  app.use app.router
  app.use express.static(__dirname + '/public')
  form({ keepExtensions: true })

app.configure 'development', ->
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true

app.configure 'production', ->
  app.use express.errorHandler()

# Routes

app.get '/posts', (request, response) ->
  Post.find {}, (err, posts) ->
    console.log posts
    response.contentType 'application/json'
    response.send { content: posts }

app.post '/posts', (request, response) ->
  post = new Post(request.body.post)
  console.log post
  post.save (err) ->
    if !err
      response.send { post: post }

app.put '/posts/:id', (request, response) ->
  console.log request.params
  Post.findOne { _id: request.params.id }, (err, post) ->
    console.log 'updating...'
    console.log request.body
    post.title = request.body.post.title
    post.description = request.body.post.description
    post.save (err) ->
      if err
        console.log err
      else
        console.log 'updated'
        console.log post
        response.send { content: post }

app.del '/posts/:id', (request, response) ->
  Post.findOne { _id: request.params.id }, (err, post) ->
    console.log 'deleting...'
    console.log post
    post.remove (err) ->
      console.log 'deleted'
      response.send()

app.post '/images', (request, response, next) ->
  request.form.complete (err, fields, files) ->
    console.log files
    response.send()

app.listen 3000
console.log "Express server listening on port %d", app.address().port

