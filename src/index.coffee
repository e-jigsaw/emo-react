React = require 'react'
Immutable = require 'immutable'
aja = require 'aja'
Emojis = require './emojis'
Finder = require './finder'

Container = React.createClass
  displayName: 'emo'

  getInitialState: ->
    emojis: Immutable.List()
    keyword: ''

  find: (event)->
    @setState
      keyword: event.target.value
    , => @searchEmoji()

  searchEmoji: ->
    r = new RegExp @state.keyword.replace /[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&'
    @setState
      emojis: @state.original.filter (emoji)-> emoji.forSearch.search(r) isnt -1

  componentDidMount: ->
    aja()
      .method 'get'
      .url '//cdn.rawgit.com/jgsme/emo/gh-pages/data/emojis.json'
      .on 'success', (emojis)=>
        emojis = emojis.map (emoji)->
          emoji.forSearch = [emoji.name].concat(emoji.keywords).join(',')
          emoji
        original = Immutable.List emojis
        @setState
          emojis: original
          original: original
      .go()

  render: ->
    React.DOM.div
      key: 'container'
    , [
      React.createElement Finder,
        find: @find
        keyword: @state.keyword
      React.createElement Emojis,
        emojis: @state.emojis
    ]

React.render React.createElement(Container), document.body
