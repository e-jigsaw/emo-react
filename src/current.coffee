React = require 'react'

module.exports = React.createClass
  toMD: (emoji)-> ":#{emoji}:"
  selectInput: -> @refs.currentInput.getDOMNode().select()

  showCurrent: ->
    if @props.emoji.name.length is 0 then [] else [
      React.DOM.p
        key: 'current-container'
        className: 'current-container'
        onClick: @selectInput
      , @showEmoji()
      React.DOM.p
        key: 'current-tag'
      , @showTag()
    ]

  showEmoji: ->
    [
      React.DOM.span
        key: "current-#{@props.emoji.name}"
        className: "emo emoji v-align s_#{@props.emoji.name}"
      React.DOM.input
        key: "current-input-#{@props.emoji.name}"
        value: @toMD(@props.emoji.name)
        id: 'currentInput'
        className: 'v-align'
        readOnly: true
        ref: 'currentInput'
    ]

  showTag: ->
    res = []
    res.push(
      React.DOM.span
        key: "current-tag-#{@props.emoji.unicode}"
        className: 'tag tag-blue'
      , @props.emoji.unicode
    )
    for keyword in @props.emoji.keywords
      res.push(
        React.DOM.span
          key: "current-tag-#{keyword}"
          className: 'tag tag-green'
          onClick: @props.searchByTag
        , keyword
      )
    res.push(
      React.DOM.a
        key: 'current-link'
        href: 'https://github.com/jgsme/emo/edit/master/src/data/emojis.custom.ja.json'
      , [
        React.DOM.span
          key: 'current-link-span'
          className: 'tag tag-red'
        , 'Add new one?'
      ]
    )
    res

  render: ->
    React.DOM.div
      key: 'current'
      id: 'info'
      className: 'emojis'
    , @showCurrent()
