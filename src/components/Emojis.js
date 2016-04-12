import React, {Component} from 'react'
import {Container} from 'flux/utils'
import FilteredEmojis from '../stores/filteredEmojis.js'
import {dispatch} from '../dispatcher.js'
import {types, getEmojis} from '../actions.js'

class Emojis extends Component {
  static getStores() {
    return [FilteredEmojis]
  }

  static calculateState (prev) {
    return {
      emojis: FilteredEmojis.getState()
    }
  }

  componentDidMount () {
    getEmojis()
  }

  onClick (emoji) {
    return (event) => {
      console.log(emoji, event)
    }
  }

  render () {
    const normalizeName = (name) => {
      return name.replace(/\+/, '')
    }
    const emojiElements = this.state.emojis.valueSeq().map((emoji, i) => {
      return jade`
        span(
          key='{i}'
          className="{'emo emo-margin emoji s_' + normalizeName(emoji.get('name'))}"
          onClick='{this.onClick(emoji)}'
        )
      `
    })

    return jade`
      .emojis {emojiElements}
    `
  }
}

export default Container.create(Emojis)
