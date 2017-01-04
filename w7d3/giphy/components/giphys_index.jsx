import React, { Component } from 'react';

class GiphysIndex extends React.Component {
  constructor (props) {
    super(props);
  }

  render () {
    return <ul>
      {this.props.giphys.map( (gif, idx) =>
        <li key={idx}><img src={gif.images.original.url}></img></li>)}
    </ul>;
  }
}

export default GiphysIndex;
