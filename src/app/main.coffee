window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}

MainRouter = require('routers/main_router').MainRouter
HomeView = require('views/home_view').HomeView

{ZooModel} = require('models/zoo_model')
{AnimalModel} = require('models/animal_model')

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.routers.main = new MainRouter()
    app.views.home = new HomeView()
    app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''
  app.initialize()
  Backbone.history.start()

  zoo = new ZooModel {name: 'Happy Animals'}
  console.log zoo.toJSON()

  # adding an animal
  zoo.get('animals').add {name: "Simba", kind: "Lion"}

  console.log zoo.get('animals').toJSON()

  sameZoo = zoo.get('animals').first().get('livesIn')
  console.log sameZoo.toJSON()