'use strict';
class Skwk.Models.Sk extends Backbone.Model
  url: '',

  defaults:
    blades: new Skwk.Collections.Blades
    title: 'Swiss Kniffe WebKit'

  validate: (attrs, options) ->

  parse: (response, options) ->
    response

  addBlade: ( attrs ) ->
    @get('blades').add( attrs )
    @trigger('change:blades')


  initialize: () ->
    #console.log Skwk
    @blades = new Skwk.Collections.Blades
    @
