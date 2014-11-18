window.Skwk =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Controllers: {}
  init: ->
    'use strict'
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
    test = new Skwk.Views.Sk(blades: blades)
    test.render()
    console.log 'Hello from Backbone!'


$ ->
  'use strict'
  Skwk.init();

String::capitalize = () ->
  (this.split(/\s+/).map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '
