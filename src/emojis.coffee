React = require 'react'

module.exports = React.createClass
  displayName: 'emojis'

  correctName: (name)-> name.replace /\+/, ''

  renderEmojis: -> @props.emojis.map (emoji)=>
    React.DOM.span
      key: emoji.name
      className: "emo emo-margin emoji s_#{@correctName emoji.name}"
      'data-emoji-name': emoji.name
      'data-emoji-keywords': emoji.keywords
      'data-emoji-unicode': emoji.unicode
      onClick: @props.show

  render: ->
    React.DOM.div
      key: 'emojis'
      className: 'emojis'
    , @renderEmojis().toArray()
