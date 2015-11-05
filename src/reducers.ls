require! {
  redux: {combine-reducers}
  \./actions.ls : {RECEIVE_EMOJIS, SEARCH_BY_WORDS, SELECT_EMOJI}
}

module.exports =
  combine-reducers do
    emojis: (state = [], action)->
      | action.type is RECEIVE_EMOJIS =>
        action.json.map (emoji)->
          emoji
            ..forSearch = [emoji.name].concat emoji.keywords .join ','
            ..unicode = emoji.keywords[*-1]
            ..keywords = emoji.keywords.slice 0, -1
      | otherwise => state
    search-word: (state = '', action)->
      | action.type is SEARCH_BY_WORDS => action.text
      | otherwise => state
    filtered-emojis: (state = [], action)->
      | action.type is RECEIVE_EMOJIS => action.json
      | action.type is SEARCH_BY_WORDS =>
        r = new RegExp action.text.replace /[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&'
        action.emojis.filter (emoji)-> r |> emoji.forSearch.search |> (isnt -1)
      | otherwise => state
