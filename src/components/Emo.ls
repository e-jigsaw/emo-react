require! {
  react: {Component, DOM, create-element}
  \react-redux : {connect}
  \../actions.ls : {get-emojis, search-by-words, select-emoji}
  \./Finder.ls
  \./Emojis.ls
}

class Emo extends Component
  component-will-mount: ->
    @props.dispatch get-emojis!

  render: ->
    DOM.div do
      key: \container
      [
        create-element do
          Finder
          search-word: @props.search-word
          onChange: (event)~>
            @props.dispatch search-by-words event.target.value
        create-element do
          Emojis
          emojis: @props.filtered-emojis
          onClick: (event)~>
            console.log event
            # @props.dispatch select-emoji
      ]

module.exports =
  connect do
    (state)-> state
  <| Emo
