import {connect} from 'react-redux'
import Emojis from '../components/Emojis.js'
import {selectEmoji} from '../actions.js'

const mapStateToProps = (state) => {
  return {
    emojis: state.filteredEmojis
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onClick: (emoji) => {
      return () => {
        dispatch(selectEmoji(emoji))
      }
    }
  }
}

const connectedEmojis = connect(
  mapStateToProps, mapDispatchToProps
)(Emojis)

export default connectedEmojis
