import React, {Component} from 'react'
import {Container} from 'flux/utils'
import EmoStore from '../store.js'
import {dispatch} from '../dispatcher.js'
import {types, getEmojis} from '../actions.js'

class Emojis extends Component {
  static getStores() {
    return [EmoStore]
  }

  static calculateState (prev) {
    return {
      emojis: EmoStore.getState()
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

const EmojisContainer = Container.create(Emojis)
export default EmojisContainer
