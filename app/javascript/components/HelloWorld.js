import React from "react"

class HelloWorld extends React.Component {
  constructor(props){
    super(props)
  }


  render () {
    return (
      <h1>
        Sup: {this.props.greeting}
      </h1>
    );
  }
}

export default HelloWorld
