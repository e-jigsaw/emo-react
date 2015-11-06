require! {
  \isomorphic-fetch : fetch
}

action-types =
  <[
    GET_EMOJIS
    RECEIVE_EMOJIS
    SEARCH_BY_WORDS
    SELECT_EMOJI
  ]>
action-types.map (type)-> exports[type] = type
refs =
  action-types.reduce do
    (prev, current)->
      prev[current] = current
      prev
    {}

exports.receive-emojis = receive-emojis = (json)->
  type: refs.RECEIVE_EMOJIS
  json: json

exports.search-by-words = search-by-words = (text, dispatch, get-state)--> dispatch do
  type: refs.SEARCH_BY_WORDS
  text: text
  emojis: get-state!.emojis

exports.get-emojis = -> (dispatch)->
  fetch \//cdn.rawgit.com/jgsme/emo/gh-pages/data/emojis.json
    .then (res)-> res.json!
    .then (json)->
      dispatch receive-emojis json
      dispatch search-by-words location.hash.replace /#/, ''

exports.select-emoji = (emoji)->
  type: refs.SELECT_EMOJI
  emoji: emoji
