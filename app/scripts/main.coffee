window.Skwk =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Controllers: {}
  params: {}
  init: ->
    'use strict'
    test = new Skwk.Views.Sk({blades: Skwk.params.blades, title: Skwk.params.title})
    test.render()
    console.log 'Hello from Backbone!'


$ ->
  'use strict'
  Skwk.init();

String::capitalize = () ->
  (this.split(/\s+/).map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '
