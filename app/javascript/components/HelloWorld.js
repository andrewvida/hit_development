import React from "react"
import Fade from 'react-reveal/Fade';

class HelloWorld extends React.Component {
  constructor(props){
    super(props)
  }


  render () {
    return (
      <div>
      <Fade left>
        <h1>
          Sup: {this.props.greeting}
        </h1>
      </Fade>
      </div>
    );
  }
}

export default HelloWorld
