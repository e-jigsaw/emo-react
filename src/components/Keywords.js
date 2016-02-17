import React from 'react'

export default ({keywords, onClick}) => {
  return keywords.map((keyword, i) => {
    jade`
      span.tag.tag-green(
        key="{'current-tag-' + keyword + '-' + i}",
        onClick='{onClick(keyword)}'
      ) {keyword}
    `
  })
}
