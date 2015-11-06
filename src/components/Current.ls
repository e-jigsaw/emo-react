require! {
  react: {Component, DOM}
  \react-dom : {findDOMNode}
}

class Current extends Component
  on-click: ~> findDOMNode @refs.current-input .select!

  render: ->
    DOM.div do
      key: \current
      id: \info
      class-name: \emojis
      style:
        display: if @props.is-show then \block else \none
      [
        DOM.p do
          key: \current-container
          class-name: \current-container
          on-click: @on-click
          [
            DOM.span do
              key: "current-#{@props.emoji.name}"
              class-name: "emo emoji v-align s_#{@props.emoji.name}"
            DOM.input do
              key: "current-input-#{@props.emoji.name}"
              value: ":#{@props.emoji.name}:"
              id: \currentInput
              class-name: \v-align
              read-only: true
              ref: \currentInput
          ]
        DOM.p do
          key: \current-tag
          [
            DOM.span do
              key: "current-tag-#{@props.emoji.unicode}"
              class-name: 'tag tag-blue'
              @props.emoji.unicode
            @props.emoji.keywords.map (keyword)~>
              DOM.span do
                key: "current-tag-#{keyword}"
                class-name: 'tag tag-green'
                on-click: @props.on-click keyword
                keyword
            DOM.a do
              key: \current-link
              href: \//github.com/jgsme/emo/edit/master/src/data/emojis.custom.ja.json
              DOM.span do
                key: \current-link-span
                class-name: 'tag tag-red'
                'Add new one?'
          ]
      ]

module.exports = Current
