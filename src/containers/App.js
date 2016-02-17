import {connect} from 'react-redux'
import App from '../components/App.js'
import {getEmojis} from '../actions.js'

const mapStateToProps = (state) => {
  return {}
}

const mapDispatchToProps = (dispatch) => {
  return {
    getEmojis: () => {
      dispatch(getEmojis())
    }
  }
}

const connectedApp = connect(
  mapStateToProps, mapDispatchToProps
)(App)

export default connectedApp
