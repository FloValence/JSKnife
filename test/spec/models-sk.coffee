describe 'Sk model (SwissKniffe main container)', ->
  sk = null
  beforeEach ->
    sk = new Skwk.Models.Sk

  it 'is defined', ->
    expect( sk ).not.toBeUndefined()

  it 'has a collection of blades', ->
    expect( sk.has('blades') ).toBe(true)
    expect( sk.get('blades').models ).toBeDefined()

  it 'has a default title', ->
    expect( sk.get('title') ).toBe( 'Swiss Kniffe WebKit' )

  it 'should be able to change its title', ->
    sk.set('title', 'Mon titre')

    expect( sk.get('title') ).toBe ( 'Mon titre' )

  it 'can add blades to the Kniffe', ->
    sk.addBlade( type: 'hero' )

    addedBlade = sk.get('blades').at(0)
    expect( addedBlade.get( 'type' ) ).toBe('hero')

  it 'fire a change:blades event when a blade is added', ->
    eventSpy = jasmine.createSpy 'spy'
    ## Set a call to thhe function on Event change:blades
    sk.on('change:blades', eventSpy)

    sk.addBlade()
    expect( eventSpy ).toHaveBeenCalled()
