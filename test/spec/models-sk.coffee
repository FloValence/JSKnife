describe 'Sk model (SwissKniffe main container)', ->
  sk = new Skwk.Models.Sk
  beforeEach ->
    sk.get('blades').reset()
    sk = new Skwk.Models.Sk(title: {content: 'Florian test le titre', titleClass: 'maClass'})

  it 'is defined', ->
    expect( sk ).not.toBeUndefined()

  it 'has a collection of blades', ->
    expect( sk.has('blades') ).toBe(true)
    expect( sk.get('blades').models ).toBeDefined()

  xit 'has a default title', ->
    expect( sk.title.get('content') ).toBe( 'Swiss Kniffe WebKit' )

  it 'should be able to change its title', ->

    sk.get('title').set('content', 'Mon titre')

    expect( sk.get('title').get('content') ).toBe ( 'Mon titre' )

  it 'can add blades to the Kniffe', ->
    sk.addBlade( type: 'testadd' )

    addedBlade = sk.get('blades').at(0)
    expect( addedBlade.get( 'type' ) ).toBe('testadd')

  it 'fire a change:blades event when a blade is added', ->
    eventSpy = jasmine.createSpy 'spy'
    ## Set a call to thhe function on Event change:blades
    sk.on('change:blades', eventSpy)

    sk.addBlade()
    expect( eventSpy ).toHaveBeenCalled()


  it 'can handle a title as parameter and convert it to a blade', ->

    expect( sk.get('title').get('content') ).toBe 'Florian test le titre'

  it 'has a paramter to show the title', ->

    expect( sk.get('title').get('show') ).toBeDefined()

    sk.get('title').set('show', true)

    expect( sk.get('title').get('show') ).toEqual true
