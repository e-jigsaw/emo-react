require! {
  react: {Component, DOM}
}

class Emojis extends Component
  render: ->
    normalize-name = (name)-> name.replace /\+/, ''

    DOM.div do
      className: \emojis
      @props.emojis.map (emoji, i)~>
        DOM.span do
          key: i
          className: "emo emo-margin emoji s_#{normalize-name emoji.name}"
          on-click: @props.on-click emoji

module.exports = Emojis
