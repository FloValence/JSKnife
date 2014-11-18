'use strict';

class Skwk.Views.Sk extends Backbone.View

  template: JST['app/scripts/templates/sk.ejs']

  el: 'section#sk'


  events: {}

  newBladeView: new Skwk.Views.NewBlade

  controllers: {
    main: null
  }

  initialize: (options) ->
    #@render()
    options = options || {}
    @model = new Skwk.Models.Sk

    # Adding th default controller
    @controllers.main = new Skwk.Controllers.createMainController @


    # Adding the blades passed as parameters
    blades = options.blades || []

    _.forEach(options.blades, (blade)=>
      console.log blade
      @addBlade blade
    )

    # Adding the listeners
    @listenTo @model, 'change', @render

    @

  render: () ->
    @$el.empty()

    # Render the title
    @$el.append '<h1>' + @model.get('title') + '</h1>'

    #@$el.html @template(@model.toJSON())

    # We get the collection from the Model
    blades = @model.get('blades')

    # We make a view for each element
    blades.each (blade)=>
      bladeView = new Skwk.Views.Blade model: blade
      this.$el.append bladeView.el

    @

  addBlade: (blade)->
    @model.addBlade blade
    @trigger('create:blade', @)

  set: (param, value)->
    if value
      @model.set(param, value)
    else
      @model.set( param )