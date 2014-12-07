describe 'Sk main view', ->
  #Adding the form to DOM, not beautiful I know :-(
  $('body').append '<section id=\'sk\'></section>'

  appView = new Skwk.Views.Sk()
  beforeEach ->
    appView.model.get('blades').reset()
    blades =
      [
        {
          title: 'Premier Blade',
          content: [
            'Mon paragraphe Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro ab nulla animi incidunt ex totam ad, iure, impedit doloribus minima, accusamus explicabo, ipsum voluptatum magni non quos corrupti natus deleniti.'
          ],
          button: {
            value: 'Mise en avant',
            action: 'appuiiie'
          }
        },
        {title: 'Deuxieme Blade',
        type: 'test'}
      ]
    appView = new Skwk.Views.Sk(blades: blades)

  it 'binds $el to the right DOM element', ->

    expect( appView.$el[0].id ).toBe('sk')
    expect( appView.$el[0].tagName.toLowerCase() ).toBe('section')

  it 'adds a blade when the controller orders and return a trigger', ->
    eventSpy = jasmine.createSpy 'blade created'
    appView.on('create:blade', eventSpy)

    appView.addBlade()

    expect( eventSpy ).toHaveBeenCalled()

  it 'adds blades when created with an array of objects blade as object value of blades', ->

    titre1 = appView.model.get('blades').models[0].get('title')
    titre2 = appView.model.get('blades').models[1].get('title')

    expect(titre1).toBe('Premier Blade')
    expect(titre2).toBe('Deuxieme Blade')

  it 'should render its model\'s title if showTitle is set to true', ->
    appView.model.get('title').set('show', true)

    appView.render()

    expect(appView.$('h1:first').text()).toBe(appView.model.get('title').get('content'))


  it 'should render all its blades', ->
    appView.render()
    expect(appView.$('h2:first').text()).toBe('Premier Blade')

  it 'shouldn\'t render unpublish blades', ->
    appView.addBlade({title: 'Unpublished Blade',type: 'test', publish: false})
    appView.render()
    expect(appView.$('h2:contains("Unpublished Blade")')[0]).toBeUndefined()

  xit 'should change the model attributes via a shorcut View.set', ->
    appView.set('title', {value: 'New title'})

    expect(appView.model.get( 'title' ).value).toBe( 'New title' )

    appView.set({title: {value: 'Flo an mèt'}})
    expect(appView.model.get( 'title' ).value).toBe( 'Flo an mèt' )
