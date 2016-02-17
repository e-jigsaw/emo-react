import fetchShim from 'isomorphic-fetch'
import promiseShim from 'es6-promise'

if (fetch === undefined) {
  fetch = fetchShim
}

if (Promise === undefined) {
  Promise = promiseShim
}

const receiveEmojis = (json) => {
  return {
    type: 'RECEIVE_EMOJIS',
    json
  }
}

const selectEmoji = (emoji) => {
  return {
    type: 'SELECT_EMOJI',
    emoji
  }
}

const searchByWords = (text) => {
  return (dispatch, getState) => {
    const {emojis} = getState()
    dispatch({
      type: 'SEARCH_BY_WORDS',
      text, emojis
    })
  }
}

const getEmojis = () => {
  return (dispatch, getState) => {
    fetch('//cdn.rawgit.com/jgsme/emo/gh-pages/data/emojis.json')
      .then((res) => {
        return res.json()
      }).then((json) => {
        const hash = location.hash.replace(/#/, '')
        dispatch(receiveEmojis(json))
        dispatch(searchByWords(hash))
      })
  }
}

export {
  receiveEmojis, selectEmoji, searchByWords, getEmojis
}
