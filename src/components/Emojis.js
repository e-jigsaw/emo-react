import React from 'react'

export default ({emojis, onClick}) => {
  const normalizeName = (name) => {
    return name.replace(/\+/, '')
  }
  const generateEmojis = emojis.map((emoji, i) => {
    return jade`
      span(
        key='{i}',
        className="{'emo emo-margin emoji s_' + normalizeName(emoji.name)}",
        onClick='{onClick(emoji)}'
      )
    `
  })

  return jade`
    .emojis {generateEmojis}
  `
}
