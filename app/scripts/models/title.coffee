'use strict';

class Skwk.Models.Title extends Backbone.Model
  url: '',

  initialize: () ->

  defaults:
    title: 'Knife\'s title'
    content: 'Knife\'s title'
    type: 'title'
    show: false
    titleClass: ''

  validate: (attrs, options) ->

  parse: (response, options) ->
    response
