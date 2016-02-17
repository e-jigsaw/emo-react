import React from 'react'
import {findDOMNode} from 'react-dom'
import Keywords from './Keywords.js'
const {Component} = React

export default class Current extends Component {
  onClick () {
    findDOMNode(this.refs.currentInput).select()
  }

  getStyle () {
    if (this.props.isShow) {
      return {
        display: 'block'
      }
    } else {
      return {
        display: 'none'
      }
    }
  }

  generateKeywordElements () {
    return this.props.emoji.keywords.map((keyword, i) => {
      return jade`
        span.tag.tag-green(
          key="{'current-tag-' + keyword + '-' + i}",
          onClick='{this.props.onClick(keyword)}'
        ) {keyword}
      `
    })
  }

  render () {
    return jade`
      #info.emojis(style='{this.getStyle()}')
        p.current-container(onClick='{this.onClick.bind(this)}')
          span(className="{'emo emoji v-align s_' + this.props.emoji.name}")
          input#currentInput.v-align(
            value="{':' + this.props.emoji.name + ':'}",
            readOnly='{true}',
            ref="{'currentInput'}"
          )
        p
          span.tag.tag-blue {this.props.emoji.unicode}
          | {this.generateKeywordElements()}
          a(href='//github.com/jgsme/emo/edit/master/src/data/emojis.custom.ja.json')
            span.tag.tag-red Add new one?
    `
  }
}
