mongoose = require 'mongoose'

mongoose.connect 'mongodb://xxx:xxx@hugob.co:27018/pigeon'

Schema = mongoose.Schema
ObjectId = Schema.ObjectId

Images = new Schema
  name: String

Post = new Schema
  title: String
  date: String
  tags: String
  price: Number
  description: String
  images: [Images]

mongoose.model('Post', Post)

Post = exports.Post = mongoose.model('Post');
