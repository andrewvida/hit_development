import React from "react"
import Slide from 'react-reveal/Slide';

class HelloWorld extends React.Component {
  constructor(props){
    super(props)
  }

  render () {
    return (
      <div>
      <Slide left>
        <h1>
          Sup: {this.props.greeting}
        </h1>
      </Slide>
      </div>
    );
  }
}

export default HelloWorld
