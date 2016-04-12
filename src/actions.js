import {dispatch} from './dispatcher.js'

const types = [
  'EMOJIS_RECIEVE',
  'SELECT_EMOJI',
  'SEARCH_BY_WORDS'
].reduce((prev, key) => {
  prev[key] = Symbol(key)
  return prev
}, {})

async function getEmojis () {
  const res = await fetch('//cdn.rawgit.com/jgsme/emo/gh-pages/data/emojis.json')
  const emojis = await res.json()
  const hash = location.hash.replace(/#/, '')
  dispatch({
    type: types.EMOJIS_RECIEVE,
    emojis
  })
}

export {types, getEmojis}

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
