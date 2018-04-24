import React from "react"
import Slide from 'react-reveal/Slide';

export default class DepartmentPosts extends React.Component {
  constructor(props){
    super(props)

    this.state = {
      filterField: '',
      postType: null
    }
  }

  filterPostsByInput($event) {
    this.setState({filterField: $event.target.value})
  }

  filterPostsByType(type) {
    this.setState({
      postType: type
    })
  }

  sortingFilter(type, array){
    return (type === null) ? array : array.filter((post) => post.post_type === this.state.postType)
  }

  _ui_filter_navigation(post) {
    return (
      <ul className="nav-pills nav">
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, null)} className={this.state.postType === null ? "nav-link active" : "nav-link"}>All</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 0)} className={this.state.postType === 0 ? "nav-link active" : "nav-link"}>Announcements</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 1)} className={this.state.postType === 1 ? "nav-link active" : "nav-link"}>FAQs</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 2)} className={this.state.postType === 2 ? "nav-link active" : "nav-link"}>How-Tos</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 3)} className={this.state.postType === 3 ? "nav-link active" : "nav-link"}>Links &amp; Forms</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 4)} className={this.state.postType === 4 ? "nav-link active" : "nav-link"}>Department News</a>
        </li>
      </ul>
    )
  }

  _ui_link_render(post) {
    return '/posts/'+ post.id
  }

  _ui_filterable_list () {
    var self = this
    var filtered = this.props.posts.filter((post) => post.title.toLowerCase().indexOf(this.state.filterField.toLowerCase()) !== -1);

    return this.sortingFilter(this.state.postType, filtered).map(function(post, index) {
      return (
        <div key={index}>
          <a href={self._ui_link_render(post)}>{post.title} :: {post.post_type}</a>
        </div>
        )
    })
  }

  render () {
    return (
      <div>
        <div className="post-list-filter-container">
          { this._ui_filter_navigation() }
          <div className="filter-field">
            <input type="text" className="form-control" onChange={this.filterPostsByInput.bind(this)}/>
          </div>
        </div>
        { this._ui_filterable_list() }
      </div>
    );
  }
}
