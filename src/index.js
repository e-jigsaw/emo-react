import React from 'react'
import {render} from 'react-dom'
import {Provider} from 'react-redux'
import {applyMiddleware, createStore} from 'redux'
import thunkMiddleware from 'redux-thunk'
import reducers from './reducers.js'
import App from './containers/App.js'
const {createElement} = React

const store = applyMiddleware(thunkMiddleware)(createStore)(reducers)

render(
  createElement(
    Provider, {
      store
    }, createElement(App)
  ),
  document.getElementById('app')
)
