import React from "react"
import { Editor } from 'react-draft-wysiwyg';
import { EditorState, convertToRaw, ContentState } from 'draft-js';
import draftToHtml from 'draftjs-to-html';
import htmlToDraft from 'html-to-draftjs';

export default class Wysiwyg extends React.Component {
  constructor(props){
    super(props)
    const html = this.props.details;
    const contentBlock = htmlToDraft(html);

    if (contentBlock) {
      const contentState = ContentState.createFromBlockArray(contentBlock.contentBlocks);
      const editorState = EditorState.createWithContent(contentState);

      this.state = {
        editorState,
      };
    }
  }

  onEditorStateChange: Function = (editorState) => {
    this.setState({
      editorState
    });


  };

  render() {
    const { editorState } = this.state;

    // Crazy jQuery hack
    // ----------------
    // I'm sure I've broken at least 3 laws with this implementation
    // Forgive me, Mom
    $('.wz-output').val(draftToHtml(convertToRaw(editorState.getCurrentContent())))

    return (
      <div className="wysiwyg-editor">
        <Editor
          editorState={editorState}
          wrapperClassName="demo-wrapper"
          editorClassName="demo-editor"
          onEditorStateChange={this.onEditorStateChange}
          toolbar={{
            options: ['inline', 'list', 'colorPicker', 'link', 'emoji', 'image'],
            inline: {
              options: ['bold', 'italic', 'underline', 'strikethrough']
            },
            list: { inDropdown: true },
            textAlign: { inDropdown: true },
            link: { inDropdown: true },
            history: { inDropdown: true }
          }} />
      </div>

    )
  }
}

