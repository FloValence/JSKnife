describe 'New Blade view', ->
  #Adding the form to DOM, not beautiful I know :-(
  $('#sk').after '<section id=\'new-blade\'></section>'

  view = null
  beforeEach ->
    view = new Skwk.Views.NewBlade()

  it 'binds $el to the right DOM element', ->

    expect( view.$el[0].id ).toBe('new-blade')
    expect( view.$el[0].tagName.toLowerCase() ).toBe('section')

  it 'should trigger a create:blades event when the button is clicked', ->
    eventSpy = jasmine.createSpy 'spy'
    view.on('create-blade', eventSpy)

    $('section#new-blade button').click()

    expect( eventSpy ).toHaveBeenCalledWith(view)

  describe 'getParams() method', ->
    it 'exposes the content of the text area', ->
      $('section#new-blade textarea').val('I AM A NEW Blade')
      expect( view.getParams() ).toBe( 'I AM A NEW Blade' )
