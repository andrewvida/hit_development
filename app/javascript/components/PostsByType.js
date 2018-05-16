import React from "react"
import moment from 'moment'

export default class PostsByType extends React.Component {
  constructor(props){
    super(props)

    this.state = {
      filterField: '',
      postDept: null
    }
  }

  filterPostsByInput($event) {
    this.setState({filterField: $event.target.value})
  }

  filterPostsByDepartment(dept) {
    this.setState({
      postDept: dept
    })
  }

  sortingFilter(dept, array){
    return (dept === null) ? array : array.filter((post) => post.department_id === this.state.postDept)
  }

  _ui_filter_navigation(post) {
    return (
      <ul className="nav-pills nav flex-column">
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByDepartment.bind(this, null)} className={this.state.postDept === null ? "nav-link active" : "nav-link"}>All</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByDepartment.bind(this, 1)} className={this.state.postDept === 1 ? "nav-link active" : "nav-link"}>Executive</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByDepartment.bind(this, 2)} className={this.state.postDept === 2 ? "nav-link active" : "nav-link"}>Software</a>
        </li>

        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByDepartment.bind(this, 3)} className={this.state.postDept === 3 ? "nav-link active" : "nav-link"}>Purchasing</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByDepartment.bind(this, 4)} className={this.state.postDept === 4 ? "nav-link active" : "nav-link"}>Operations</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByDepartment.bind(this, 5)} className={this.state.postDept === 5 ? "nav-link active" : "nav-link"}>Engineering</a>
        </li>
        <li className="nav-item">
          <a href="#" onClick={this.filterPostsByDepartment.bind(this, 6)} className={this.state.postDept === 6 ? "nav-link active" : "nav-link"}>Project Management</a>
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

    if (this.sortingFilter(this.state.postDept, filtered).length === 0) {
      return (
        <div className="empty">
          <span>Nothing to show</span>
        </div>
        )
    } else {
      return this.sortingFilter(this.state.postDept, filtered).map(function(post, index) {
        return (
          <div key={index} className="department-post-list">
            <article className={self._ui_render_post_type_class(post.post_type_id)}>
              <a className="post-title" href={self._ui_link_render(post)}>{post.title}</a>
              <span className="date">{moment(post.updated_at).format('ll')}</span>
              <p>{post.summary}</p>
              <a href={self._ui_link_render(post)}>Read more</a>
            </article>
          </div>
          )
      })
    }
  }



  render () {
    return (
      <div>
        <div id="type-posts">
          <div className="type-post-nav">
            { this._ui_filter_navigation() }
          </div>
          <div className="type-post-list">
            <div className="post-list-filter-container">
              <div className="filter-field">
                <input type="text" className="form-control" onChange={this.filterPostsByInput.bind(this)} placeholder="Search by title"/>
              </div>
            </div>
            { this._ui_filterable_list() }
          </div>
        </div>

      </div>
    );
  }
}
