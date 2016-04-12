import React, {Component} from 'react'
import {findDOMNode} from 'react-dom'
import {Container} from 'flux/utils'
import CurrentTextStore from '../stores/currentText.js'
import {dispatch} from '../dispatcher.js'
import {types} from '../actions.js'

class Finder extends Component {
  static getStores() {
    return [CurrentTextStore]
  }

  static calculateState () {
    return {
      text: CurrentTextStore.getState()
    }
  }

  componentDidMount () {
    findDOMNode(this.refs.input).focus()
  }

  onChange (event) {
    dispatch({
      type: types.SEARCH_BY_WORDS,
      value: event.target.value
    })
  }

  render () {
    return jade`
      form.pure-form(onsubmit='{false}')
        input(
          id='in'
          type='text'
          ref='input'
          value='{this.state.text}'
          onChange='{this.onChange}'
        )
    `
  }
}

export default Container.create(Finder)
