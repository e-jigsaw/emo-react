require! {
  react: {Component, DOM}
  \react-dom : {findDOMNode}
}

class Finder extends Component
  componentDidMount: -> findDOMNode @refs.input .focus!

  render: ->
    DOM.form do
      class-name: \pure-form
      onsubmit: false
      DOM.input do
        id: \in
        type: \text
        ref: \input
        value: @props.search-word
        on-change: @props.onChange

module.exports = Finder