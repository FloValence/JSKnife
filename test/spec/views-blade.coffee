describe 'Blade view', ->
  createView = ( model = new Skwk.Models.Blade() ) ->
    new Skwk.Views.Blade(model:model)

  it 'is a div.blade',->
    view = createView()
    expect( view.$el[0].className ).toBe('blade')
    expect( view.$el[0].tagName.toLowerCase() ).toBe('div')

  it 'renders a div.blade',->
    view = createView()
    expect( view.render().$el.is('div.blade') ).toBeTruthy()

  it 'renders blade\'s title',->
    view = createView( new Skwk.Models.Blade({ title: 'Hero banner'}) )
    expect( view.render().$el.find('h2').text() ).toBe('Hero banner')

  it 'renders blade\'s content',->
    content = [
      'Set this place on fire<br>Ooh it\’s hot',
      'Cause somewhere in America<br>Miley Cyrus is still twerkin\''

    ]
    view = createView( new Skwk.Models.Blade({ content: content }) )
    expect( view.render().$el.find('p')[0].textContent ).toBe('Set this place on fireOoh it\’s hot')
    expect( view.render().$el.find('p')[1].textContent ).toBe('Cause somewhere in AmericaMiley Cyrus is still twerkin\'')
