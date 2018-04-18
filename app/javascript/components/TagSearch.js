import React from "react"
import TagsInput from 'react-tagsinput'

class TagSearch extends React.Component {
  constructor(props) {
    super(props)
    this.state = {tags: []}

    console.log(this.props.taggings)
    this.handleChange = this.handleChange.bind(this)
  }

  handleChange(tags) {
    this.setState({tags})
  }

  render () {
    return (
      <div>
        <TagsInput value={this.state.tags} onChange={this.handleChange.bind(this)} />
      </div>
    );
  }
}

export default TagSearch
