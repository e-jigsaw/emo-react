import React, {Component} from 'react'
import {findDOMNode} from 'react-dom'

export default class Finder extends Component {
  componentDidMount () {
    findDOMNode(this.refs.input).focus()
  }

  render () {
    return jade`
      form.pure-form(onsubmit='{false}')
        input(
          id='in'
          type='text'
          ref='input'
          value='{this.props.searchWord}'
          onChange='{this.props.onChange}'
        )
    `
  }
}
