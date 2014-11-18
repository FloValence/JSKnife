'use strict';

class Skwk.Views.NewBlade extends Backbone.View

  template: JST['app/scripts/templates/new-blade.ejs']

  #tagName: ''

  el: 'section#new-blade'

  #id: ''

  className: 'newblade'

  events:
    'click button': 'onButtonClick'

  initialize: () ->
    #@listenTo @model, 'change', @render
    @render()

  render: () ->
    @$el.html @template()

  onButtonClick: ->
    @trigger 'create-blade', @

  getParams: ()->
    console.log @$('textarea').val()
    @$('textarea').val()
