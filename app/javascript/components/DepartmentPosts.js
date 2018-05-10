import React from "react"
import moment from 'moment'

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
    return (type === null) ? array : array.filter((post) => post.post_type_id === this.state.postType)
  }

  _ui_filter_navigation(post) {
    return (
      <ul className="nav-pills nav">
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, null)} className={this.state.postType === null ? "nav-link active" : "nav-link"}><span className="key bg-light"></span> All</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 3)} className={this.state.postType === 3 ? "nav-link active" : "nav-link"}><span className="key bg-purple"></span> How-Tos</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 4)} className={this.state.postType === 4 ? "nav-link active" : "nav-link"}><span className="key bg-green"></span> FAQs</a>
        </li>

        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 5)} className={this.state.postType === 5 ? "nav-link active" : "nav-link"}><span className="key bg-pink"></span> Jobs</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 6)} className={this.state.postType === 6 ? "nav-link active" : "nav-link"}><span className="key bg-blue"></span> Department News</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByType.bind(this, 7)} className={this.state.postType === 7 ? "nav-link active" : "nav-link"}><span className="key bg-yellow"></span> Links &amp; Forms</a>
        </li>
      </ul>
    )
  }

  _ui_link_render(post) {
    return '/posts/'+ post.id
  }

  _ui_render_post_type_class(post_type) {
    switch(post_type) {
      case 3:
        return 'post-type--howto';
      break;

      case 4:
        return 'post-type--faq';
      break;

      case 5:
        return 'post-type--job';
      break;

      case 6:
        return 'post-type--blog';
      break;

      case 7:
        return 'post-type--linkto';
      break;

      default:
        return 'post-type--blog'
    }
  }

  _ui_filterable_list () {
    var self = this
    var filtered = this.props.posts.filter((post) => post.title.toLowerCase().indexOf(this.state.filterField.toLowerCase()) !== -1);

    return this.sortingFilter(this.state.postType, filtered).map(function(post, index) {
      return (
        <div key={index} className="department-post-list">
          <article className={self._ui_render_post_type_class(post.post_type_id)}>
            <a className="post-title" href={self._ui_link_render(post)}><span className="key"></span> {post.title}</a>
            <span className="date">{moment(post.updated_at).format('ll')}</span>
            <p>{post.summary}</p>
            <a href={self._ui_link_render(post)}>Read more</a>
          </article>
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
            <input type="text" className="form-control" onChange={this.filterPostsByInput.bind(this)} placeholder="Search by title"/>
          </div>
        </div>
        <div id="department-posts">
          { this._ui_filterable_list() }
        </div>

      </div>
    );
  }
}
