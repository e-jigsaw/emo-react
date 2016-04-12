import {ReduceStore} from 'flux/utils'
import Immutable from 'immutable'
import {types} from '../actions.js'
import dispatcher, {dispatch} from '../dispatcher.js'
import EmojiStore from './emoji.js'
import CurrentTextStore from './currentText.js'

class FilteredEmojis extends ReduceStore {
  getInitialState () {
    return Immutable.Map()
  }

  reduce (state, action) {
    switch (action.type) {
      case types.EMOJIS_RECIEVE: {
        dispatcher.waitFor([EmojiStore.dispatchToken])
        return EmojiStore.getState()
      }
      case types.SEARCH_BY_WORDS: {
        dispatcher.waitFor([])
        const emojis = EmojiStore.getState()
        const text = CurrentTextStore.getState()
        const r = new RegExp(text.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&'))
        return emojis.valueSeq().filter((emoji) => {
          const res = emoji.get('forSearch').search(r)
          return res !== -1
        })
      }
      default: {
        return state
      }
    }
  }
}

export default new FilteredEmojis(dispatcher)
