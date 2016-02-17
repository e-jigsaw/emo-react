import React from 'react'
import Finder from '../containers/Finder.js'
import Current from '../containers/Current.js'
import Emojis from '../containers/Emojis.js'
const {Component} = React

export default class App extends Component {
  componentDidMount () {
    this.props.getEmojis()
  }

  render () {
    return jade`
      div
        Finder
        Current
        Emojis
    `
  }
}
