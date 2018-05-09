import React from "react"
import Wysiwyg from "./Wysiwyg"
import TagSearch from "./TagSearch"

export default class PostForm extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      selectedPostType: '',
      submitErrors: [],
      _title: this.props.post.title,
      _tag_names: this.props.post.tag_names,
      _summary: this.props.post.summary,
      _post_type_id: this.props.post.post_type_id || 1,
      _id: this.props.post.id,
      _image_url: this.props.post.image_url,
      _expiration_date: this.props.post.expiration_date,
      _department_id: this.props.post.department_id || this.props.user_post_data.current_user.department_id,
      _body: this.props.post.body,
      _author_id: this.props.post.author_id,
      _action_url: this.props.post.action_url
    }
  }

  componentDidMount() {
    console.log(this.props)
  }

  _ux_update_post_type(event) {
    this.setState({selectedPostType: event.target.dataset.postType})
  }

  _ux_submit_post(event) {

    console.log('title:', event.target.elements['post[title]'].value)
    console.log('body:', event.target.elements['post[body]'].value)
    console.log('summary:', event.target.elements['post[summary]'].value)
    console.log('post_type_id:', event.target.elements['post[post_type_id]'].value)
    console.log('id:', event.target.elements['post[id]'].value)
    console.log('image_url:', event.target.elements['post[image_url]'].value)
    console.log('action_url:', event.target.elements['post[action_url]'].value)
    console.log('author_id:', event.target.elements['post[author_id]'].value)
    console.log('expiration_date:', event.target.elements['post[expiration_date]'].value)

    event.preventDefault()
  }

  _ui_render_error () {
    if (this.state.submitErrors.length) {
      return (
        <div id="error_explanation">
          <div className="alert alert-danger">
            <span>Errors here</span>
          </div>
        </div>
      )
    }
  }

  _ui_render_title () {
    return (
      <div className="form-group">
        <label htmlFor="post-title">Title</label>
        <input type="text" id="post-title" name="post[title]" className="form-control form-control-lg"/>
      </div>
    )
  }

  _ui_render_action_url () {
    return (
      <div className="form-group">
        <label htmlFor="post-action-url">Add a Link</label>
        <input type="text" name="post[action_url]" className="form-control form-control-lg"/>
      </div>
    )
  }

  _ui_render_image_url () {
    return (
      <div className="form-group">
        <input type="file" name="post[image_url]" className="form-control form-control-lg" />
        <div className="drag-drop-file-upload">
          <div className="drop-zone">
            <div className="icon">
              <span className="far fa-images"></span>
            </div>
            <p className="lead">
              Drag your files here to upload or
              <a href="#upload"> click here</a>
            </p>
          </div>
        </div>

      </div>
    )
  }

  _ui_render_department_selector () {
    return (
      <div className="form-group">
        <label htmlFor="post-department">Department</label>
        <select name="post[department]" className="form-control form-control-lg">
          { this.props.user_post_data.available_departments.map((dept, index) => {
            return (<option key={index} value={this.state._department_id}>{dept.name}</option>)
          }) }
        </select>
      </div>
    )
  }

  _ui_render_post_type_selector () {
    return (
      <div className="form-group">
        <label>Choose a type of post</label>
        <div className="post-type-container">
          { this.props.user_post_data.available_post_types.map((post_type, index) => {
            return (
              <div className="post-type" key={index}>
                <label htmlFor={"pt-"+post_type.id}>
                  <input id={"pt-"+post_type.id} value={post_type.id} onChange={this._ux_update_post_type.bind(this)} type="radio" data-post-type={post_type.name} name="post[post_type_id]" className="form-control form-control-lg"/>

                  <div className="post-type-block">
                    <div className="icon">
                      <img src={"/admin-images/"+post_type.name+".png"}/>
                    </div>
                    <div className="description">
                      <p><span>{post_type.title}</span> {post_type.description}</p>
                    </div>
                  </div>
                </label>
              </div>
            )
          }) }
        </div>

      </div>
    )
  }

  _ui_render_form() {
    return (
      <form onSubmit={this._ux_submit_post.bind(this)}>
        { this._ui_render_error() }
        {this._ui_render_post_type_selector()}
        {this._ui_render_image_url()}
        <div className="row">
          <div className="col-9">{ this._ui_render_title() }</div>
          <div className="col-3">{ this._ui_render_department_selector() }</div>
        </div>
        <div className="form-group field details">
          <Wysiwyg body={this.props.post.body || ''}/>
        </div>
        <div className="row">
          <div className="col-6">{this._ui_render_action_url()}</div>
          <div className="col-6">
            <div className="form-group tags">
              <label>Add tags</label>
              <TagSearch taggings={this.props.taggings} terms={this.props.post.tag_names} binding="post[tag_names]"/>
            </div>
          </div>
        </div>
        <input type="hidden" name="post[body]" className="wz-output"/>
        <input type="hidden" name="post[author_id]" className="wz-output" value={this.props.user_post_data.current_user.id}/>
        <button type="submit" className="btn btn-success btn-lg">Save Post</button>
      </form>
    )
  }

  render () {
    if (this.props.user_post_data.available_post_types.length < 1) {
      return (
        <div id="#post-form-view">
          <div className="alert alert-light">
            You can't post here
          </div>
        </div>
      );
    } else {
      return (
        <div id="#post-form-view">
          { this._ui_render_form() }
        </div>
      );
    }
  }

}