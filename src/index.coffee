React = require 'react'
Immutable = require 'immutable'
aja = require 'aja'
Emojis = require './emojis'
Current = require './current'
Finder = require './finder'

Container = React.createClass
  displayName: 'emo'

  getInitialState: ->
    emojis: Immutable.List()
    keyword: ''
    currentEmoji:
      name: ''
      unicode: ''
      keywords: []

  find: (event)->
    @setState
      keyword: event.target.value
    , => @searchEmoji()

  searchEmoji: ->
    r = new RegExp @state.keyword.replace /[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&'
    @setState
      emojis: @state.original.filter (emoji)-> emoji.forSearch.search(r) isnt -1

  searchByTag: (event)->
    @setState
      keyword: event.target.textContent
    , => @searchEmoji()

  show: (event)->
    @setState
      currentEmoji:
        name: event.target.getAttribute 'data-emoji-name'
        unicode: event.target.getAttribute 'data-emoji-unicode'
        keywords: event.target.getAttribute('data-emoji-keywords').split ','

  componentDidMount: ->
    aja()
      .method 'get'
      .url '//cdn.rawgit.com/jgsme/emo/gh-pages/data/emojis.json'
      .on 'success', (emojis)=>
        emojis = emojis.map (emoji)->
          emoji.forSearch = [emoji.name].concat(emoji.keywords).join(',')
          emoji.unicode = emoji.keywords[emoji.keywords.length - 1]
          emoji.keywords = emoji.keywords.slice 0, -1
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
      React.createElement Current,
        emoji: @state.currentEmoji
        searchByTag: @searchByTag
      React.createElement Emojis,
        emojis: @state.emojis
        show: @show
    ]

React.render React.createElement(Container), document.body
