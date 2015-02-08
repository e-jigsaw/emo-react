React = require 'react'
Immutable = require 'immutable'
aja = require 'aja'
Emojis = require './emojis'

Container = React.createClass
  displayName: 'emo'

  getInitialState: ->
    emojis: Immutable.List()

  componentDidMount: ->
    aja()
      .method 'get'
      .url '//cdn.rawgit.com/jgsme/emo/gh-pages/data/emojis.json'
      .on 'success', (emojis)=>
        @setState
          emojis: Immutable.List emojis
      .go()

  render: ->
    React.DOM.div
      key: 'container'
    , [
      React.createElement Emojis,
        emojis: @state.emojis
    ]

React.render React.createElement(Container), document.body
