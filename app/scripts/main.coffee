window.Skwk =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Controllers: {}
  Utilis: {}
  params: {}
  init: ->
    'use strict'
    test = new Skwk.Views.Sk({blades: Skwk.params.blades, title: Skwk.params.title})
    test.render()
    Skwk.Utilis.launchParallax()


$ ->
  'use strict'
  Skwk.init();

String::capitalize = () ->
  (this.split(/\s+/).map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '
