import React from 'react'
import TagsInput from 'react-tagsinput'
import Autosuggest from 'react-autosuggest'

export default class TagSearch extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      tags: this.props.terms === undefined ? [] : this.props.terms,
      taggings: this.props.taggings,
      isActive: false
    }
  }

  handleChange (tags) {
    this.setState({tags})
  }

  handleSearch () {
    window.location = "/home/search?terms=" + this.state.tags
  }

  handleActiveState () {
    this.setState({isActive: !this.state.isActive})
  }

  render () {
    var self = this;

    function autocompleteRenderInput ({addTag, ...props}) {
      const handleOnChange = (e, {newValue, method}) => {
        if (method === 'enter') {
          e.preventDefault()
        } else {
          props.onChange(e)
        }
      }

      const inputValue = (props.value && props.value.trim().toLowerCase()) || ''
      const inputLength = inputValue.length

      let suggestions = self.state.taggings.filter((state) => {
        return state.name.toLowerCase().slice(0, inputLength) === inputValue
      })

      return (

        <Autosuggest
          ref={props.ref}
          suggestions={suggestions}
          shouldRenderSuggestions={(value) => value && value.trim().length > 0}
          getSuggestionValue={(suggestion) => suggestion.name}
          renderSuggestion={(suggestion) => <span>{suggestion.name}</span>}
          inputProps={{...props, placeholder: 'Search by Keywords', onChange: handleOnChange}}
          onSuggestionSelected={(e, {suggestion}) => {
            addTag(suggestion.name)
          }}
          onSuggestionsClearRequested={() => {}}
          onSuggestionsFetchRequested={() => {}}
        />
      )
    }

    return (
      <div className={this.state.isActive ? "app-tag-input active" : "app-tag-input"} onClick={this.handleActiveState.bind(this)}>
        <TagsInput renderInput={autocompleteRenderInput} value={this.state.tags} onChange={this.handleChange.bind(this)} />
        <button className="btn btn-default" onClick={this.handleSearch.bind(this)}>
          <span className="fa fa-search"></span>
        </button>
        <input type="hidden" name={self.props.binding ? self.props.binding : ''} value={self.state.tags} onChange={this.handleChange.bind(this)}/>
      </div>
      )
  }
}