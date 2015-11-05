require! {
  react: {Component, DOM}
}

class Emojis extends Component
  render: ->
    normalize-name = (name)-> name.replace /\+/, ''

    DOM.div do
      key: \emojis
      className: \emojis
      @props.emojis.map (emoji)~>
        DOM.span do
          key: normalize-name emoji.name
          className: "emo emo-margin emoji s_#{normalize-name emoji.name}"
          onClick: @props.onClick

module.exports = Emojis
