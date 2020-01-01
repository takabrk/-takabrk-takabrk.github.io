'use strict';
const e = React.createElement;

class HelloMessage extends React.Component {
  render() {
    return e(
      "div",
      null,
      "Hello ",
      this.props.name
    );
  }
}

const domContainer=document.querySelector("#like_button_container");
ReactDOM.render(e(HelloMessage, { name: "Taylor" }),domContainer );