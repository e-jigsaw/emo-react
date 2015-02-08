React = require 'react'

module.exports = React.createClass
  displayName: 'finder'

  componentDidMount: ->
    @refs.input.getDOMNode().focus()

  render: ->
    React.DOM.form
      key: 'finder-form'
      className: 'pure-form'
      onsubmit: -> false
    , [
      React.DOM.input
        key: 'finder-input'
        id: 'in'
        type: 'text'
        ref: 'input'
        value: @props.keyword
        onChange: @props.find
    ]
