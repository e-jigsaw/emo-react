import {combineReducers} from 'redux'

const initEmoji = {
  name: '',
  keywords: [],
  forSearch: '',
  unicode: ''
}

const reducers = combineReducers({
  emojis: (state = [], action) => {
    switch (action.type) {
      case 'RECEIVE_EMOJIS': {
        return action.json.map((emoji) => {
          return Object.assign(emoji, {
            forSearch: [emoji.name].concat(emoji.keywords).join(','),
            unicode: emoji.keywords[emoji.keywords.length - 1],
            keywords: emoji.keywords.slice(0, -1)
          })
        })
      }
      default: {
        return state
      }
    }
  },
  searchWord: (state = '', action) => {
    switch (action.type) {
      case 'SEARCH_BY_WORDS': {
        location.hash = action.text
        return action.text
      }
      default: {
        return state
      }
    }
  },
  filteredEmojis: (state = [], action) => {
    switch (action.type) {
      case 'RECEIVE_EMOJIS': {
        return action.json
      }
      case 'SEARCH_BY_WORDS': {
        const r = new RegExp(action.text.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&'))
        return action.emojis.filter((emoji) => {
          const res = emoji.forSearch.search(r)
          return res !== -1
        })
      }
      default: {
        return state
      }
    }
  },
  selectedEmoji: (state = initEmoji, action) => {
    switch (action.type) {
      case 'SELECT_EMOJI': {
        return action.emoji
      }
      default: {
        return state
      }
    }
  },
  isShowSelectedEmoji: (state = false, action) => {
    switch (action.type) {
      case 'SELECT_EMOJI': {
        return true
      }
      default: {
        return state
      }
    }
  }
})

export default reducers
