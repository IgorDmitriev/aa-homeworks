import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      searchTerm: ""
    };

    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput (e) {
    this.setState({ searchTerm: e.target.value });
  }

  handleSubmit (e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.searchTerm);
  }

  render () {
    console.log(this.props);
    return <div>
      <input
        type="text"
        value={this.state.searchTerm}
        onChange={this.handleInput}></input>
      <button onClick={this.handleSubmit}>Giphyfy!</button>
      <GiphysIndex giphys={this.props.giphys}/>
    </div>;
  }
}

export default GiphysSearch;
