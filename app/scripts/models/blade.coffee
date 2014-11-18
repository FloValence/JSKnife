'use strict';

class Skwk.Models.Blade extends Backbone.Model
  url: '',

  initialize: () ->
    ## Pour définir un sous model avec plus de parametre, pertinence à évaluer
    #modelname =  'Blade' + @get('type').capitalize()
    #console.log modelname
    #@inner = new window['Skwk']['Models'][modelname]

  defaults:
    title: 'Blade\'s title'
    type: 'hero'
    content: []

  validate: (attrs, options) ->

  parse: (response, options) ->
    response
