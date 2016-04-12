import {ReduceStore} from 'flux/utils'
import {types} from '../actions.js'
import dispatcher from '../dispatcher.js'

class CurrentTextStore extends ReduceStore {
  constructor (...args) {
    super(...args)
    this.dispatchToken = dispatcher.register((action) => {
    })
  }

  getInitialState () {
    return ''
  }

  reduce (state, action) {
    switch (action.type) {
      case types.SEARCH_BY_WORDS: {
        return action.value
      }
      default: {
        return state
      }
    }
  }
}

export default new CurrentTextStore(dispatcher)
