import React from 'react'
import ReactDatePicker from 'react-date-picker';

export default class DatePicker extends React.Component {
  constructor(props){
    super(props)

    this.state = {
      date: this.props.expiration_date || new Date()
    }
  }

  _ux_update_date(event) {
    this.setState({ date: event })

    // Crazy jQuery hack
    // ----------------
    // I'm sure I've broken at least 3 laws with this implementation
    // Forgive me, Mom
    $('.expiration-output').val(event)
  }

  render () {
    return (
      <div>
        <ReactDatePicker
          onChange={this._ux_update_date.bind(this)}
          value={this.state.date}/>
      </div>
    );
  }
}