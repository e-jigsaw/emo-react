require! {
  react: {Component, DOM}
  \react-dom : {findDOMNode}
}

class Current extends Component
  on-click: ~> findDOMNode @refs.current-input .select!

  render: ->
    DOM.div do
      id: \info
      class-name: \emojis
      style:
        display: if @props.is-show then \block else \none
      DOM.p do
        class-name: \current-container
        on-click: @on-click
        DOM.span do
          class-name: "emo emoji v-align s_#{@props.emoji.name}"
        DOM.input do
          value: ":#{@props.emoji.name}:"
          id: \currentInput
          class-name: \v-align
          read-only: true
          ref: \currentInput
      DOM.p do
        DOM.span do
          class-name: 'tag tag-blue'
          @props.emoji.unicode
        @props.emoji.keywords.map (keyword, i)~>
          DOM.span do
            key: "current-tag-#{keyword}-#{i}"
            class-name: 'tag tag-green'
            on-click: @props.on-click keyword
            keyword
        DOM.a do
          href: \//github.com/jgsme/emo/edit/master/src/data/emojis.custom.ja.json
          DOM.span do
            class-name: 'tag tag-red'
            'Add new one?'

module.exports = Current
