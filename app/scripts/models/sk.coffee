'use strict';
class Skwk.Models.Sk extends Backbone.Model
  url: '',

  defaults:
    blades: new Skwk.Collections.Blades
    title: null

  validate: (attrs, options) ->

  parse: (response, options) ->
    response

  addBlade: ( attrs ) ->
    @get('blades').add( attrs )
    @trigger('change:blades')

  setTitle: (obj)->
    if typeof(obj) != {}
      obj = @get('title')
    @set('titleBlade', new Skwk.Models.Blade {title: obj.content, content: obj.content, class: obj.titleClass, type: 'title'}, obj)
    console.log obj


  initialize: (attrs) ->

    @set('title', new Skwk.Models.Title( @get('title') ))


    # Adding the page title
    if @get('title') == null
      @setTitle()

    # Setting the event listeners
    @.on 'change:title', @setTitle, @

    @
