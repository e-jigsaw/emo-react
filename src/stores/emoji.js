import Immutable from 'immutable'
import {ReduceStore} from 'flux/utils'
import {types} from '../actions.js'
import dispatcher from '../dispatcher.js'

class EmojiStore extends ReduceStore {
  constructor (...args) {
    super(...args)
    this.dispatchToken = dispatcher.register((action) => {
    })
  }

  getInitialState () {
    return Immutable.OrderedMap()
  }

  reduce (state, action) {
    switch (action.type) {
      case types.EMOJIS_RECIEVE: {
        const emojis = action.emojis.map((emoji) => {
          return Object.assign(emoji, {
            forSearch: [emoji.name].concat(emoji.keywords).join(','),
            unicode: emoji.keywords[emoji.keywords.length - 1],
            keywords: emoji.keywords.slice(0, -1)
          })
        })
        return Immutable.fromJS(emojis, (key, value) => {
          return value.toOrderedMap()
        })
      }
      default: {
        return state
      }
    }
  }
}

export default new EmojiStore(dispatcher)
