'use strict';

class Skwk.Views.Blade extends Backbone.View

  template: (model)->
    templatename = "app/scripts/templates/blade-#{@model.get('type')}.ejs"
    JST[templatename](model)

  tagName: 'div'

  id: ''

  className: 'blade'

  events: {}

  initialize: () ->
    @render()
    console.log @

  render: () ->
    @$el.html @template(@model.toJSON())
    @
