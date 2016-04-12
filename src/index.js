import 'babel-polyfill'
import 'isomorphic-fetch'
import 'es6-promise'
import {createElement} from 'react'
import {render} from 'react-dom'
import App from './components/App.js'

render(createElement(App), document.getElementById('app'))
