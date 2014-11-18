describe 'Blade model', ->
  it 'is defined', ->
    expect( Skwk.Models.Blade ).not.toBeUndefined()

  it 'looks like a BB model', ->
    blade = new Skwk.Models.Blade
    expect( _.isFunction(blade.get) ).toBe(true)
    expect( _.isFunction(blade.set) ).toBe(true)
