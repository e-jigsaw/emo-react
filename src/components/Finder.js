import React from 'react'
import {findDOMNode} from 'react-dom'
const {Component} = React

export default class Finder extends Component {
  componentDidMount () {
    findDOMNode(this.refs.input).focus()
  }

  render () {
    return jade`
      form.pure-form(onsubmit='{false}')
        input(
          id='in',
          type='text',
          ref="{'input'}",
          value='{this.props.searchWord}',
          onChange='{this.props.onChange}'
        )
    `
  }
}
