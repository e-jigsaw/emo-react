import {connect} from 'react-redux'
import Finder from '../components/Finder.js'
import {searchByWords} from '../actions.js'

const mapStateToProps = (state) => {
  return {
    searchWord: state.searchWord
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onChange: (event) => {
      dispatch(searchByWords(event.target.value))
    }
  }
}

const connectedFinder = connect(
  mapStateToProps, mapDispatchToProps
)(Finder)

export default connectedFinder
