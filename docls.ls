fs = require 'fs'
parsing = require './lib/parsing'

getFile = ->
  "docls.ls"


fs.readFile do
  getFile!
  "utf-8"
  (err, data) !->
    return console.lof err if err
    console.log parsing.generatorTuples data.split '\n'
