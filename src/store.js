import Immutable from 'immutable'
import {ReduceStore} from 'flux/utils'
import {types} from './actions.js'
import dispatcher from './dispatcher.js'

class EmoStore extends ReduceStore {
  getInitialState () {
    return Immutable.List()
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
          return value.toMap()
        })
      }
    }
  }
}

const instance = new EmoStore(dispatcher)
export default instance
