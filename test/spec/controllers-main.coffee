describe 'main controller', ->
	xit 'can be created', ->
    controller = Skwk.Controllers.createMainController()
    expect( controller ).toBeDefined()

   it 'reacts t a create-blade event by creating a new blade in the sk (call the addBlade method)', ->
    fakeNewBladeView = _.extend({ getParams: -> {title: "Title of a fake blade"} },Backbone.Events)
    fakeSk = _.extend({
      addBlade: jasmine.createSpy('spy'),
      newBladeView: fakeNewBladeView
    })

    Skwk.Controllers.createMainController( fakeSk )

    fakeNewBladeView.trigger('create-blade', fakeNewBladeView)

    expect(fakeSk.addBlade).toHaveBeenCalledWith(title: 'Title of a fake blade')

  it 'should be created with a new Sk view', ->
    appView = new Skwk.Views.Sk

    expect(appView.controllers.main).toBeDefined
