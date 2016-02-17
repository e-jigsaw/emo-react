import {connect} from 'react-redux'
import Current from '../components/Current.js'
import {searchByWords} from '../actions.js'

const mapStateToProps = (state) => {
  return {
    emoji: state.selectedEmoji,
    isShow: state.isShowSelectedEmoji
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onClick: (text) => {
      return () => {
        dispatch(searchByWords(text))
      }
    }
  }
}

const connectedCurrent = connect(
  mapStateToProps, mapDispatchToProps
)(Current)

export default connectedCurrent
