require! {
  react: {Component, DOM, create-element}
  \react-redux : {connect}
  \../actions.ls : {get-emojis, search-by-words, select-emoji}
  \./Finder.ls
  \./Current.ls
  \./Emojis.ls
}

class Emo extends Component
  component-will-mount: ->
    @props.dispatch get-emojis!

  render: ->
    DOM.div do
      key: \container
      create-element do
        Finder
        search-word: @props.search-word
        on-change: (event)~>
          @props.dispatch search-by-words event.target.value
      create-element do
        Current
        emoji: @props.selected-emoji
        is-show: @props.is-show-selected-emoji
        on-click: (text, event)~~>
          @props.dispatch search-by-words text
      create-element do
        Emojis
        emojis: @props.filtered-emojis
        on-click: (emoji, event)~~>
          @props.dispatch select-emoji emoji

module.exports =
  connect do
    (state)-> state
  <| Emo
