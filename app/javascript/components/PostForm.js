import React from "react"
import Wysiwyg from "./Wysiwyg"
import TagSearch from "./TagSearch"

export default class PostForm extends React.Component {
  constructor(props){
    super(props)

    this.state = {
    }
  }

  componentDidMount() {
    console.log(this.props.user_post_data)
  }

  _ui_render_error () {
    return (
      <div id="error_explanation">
        <span>Error here</span>
      </div>
    )
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
        <label htmlFor="post-action-url">Action URL</label>
        <input type="text" name="post[action_url]" className="form-control form-control-lg"/>
      </div>
    )
  }

  _ui_render_image_url () {
    return (
      <div className="form-group">
        <label htmlFor="post-image-url">Image URL</label>
        <input type="text" name="post[image_url]" className="form-control form-control-lg"/>
      </div>
    )
  }

  _ui_render_department_selector () {
    return (
      <div className="form-group">
        <label htmlFor="post-department">Department</label>
        <select name="post[department]" className="form-control form-control-lg">
          { this.props.user_post_data.available_departments.map((dept, index) => {
            return (<option key={index}>{dept.name}</option>)
          }) }
        </select>
      </div>
    )
  }

  _ui_render_post_type_selector () {
    return (
      <div className="form-group">
        <label htmlFor="post-image-url">Choose a type of post</label>

        <div className="post-type-container">
          { this.props.user_post_data.available_post_types.map((post_type, index) => {
            return (
              <div className="post-type" key={post_type.id}>
                <label htmlFor={"pt-"+post_type.id}>
                  <div className="post-type-block">
                    <div className="icon">
                      <img src={"/admin-images/post-type-"+post_type.id+".png"}/>
                    </div>
                    <div className="description">
                      <p><span>{post_type.title}</span> {post_type.description}</p>
                    </div>
                  </div>
                  <input type="radio" value={post_type.id} name="post[post_type_id]" className="form-control form-control-lg"/>
                </label>
              </div>
            )
          }) }
        </div>

      </div>
    )
  }

  render () {
    return (
      <div id="#post-form-view">
        <hr/>
        <form>
          {this._ui_render_error()}
          {this._ui_render_title()}
          {this._ui_render_image_url()}
          {this._ui_render_action_url()}
          {this._ui_render_department_selector()}
          {this._ui_render_post_type_selector()}

          <div className="form-group field details">
            <Wysiwyg details={this.props.post.body || ''}/>
          </div>

          <div className="form-group tags">
            <TagSearch taggings={this.props.taggings} terms={this.props.post.tag_names} binding="post[tag_names]"/>
          </div>
        </form>
      </div>
    );
  }

}