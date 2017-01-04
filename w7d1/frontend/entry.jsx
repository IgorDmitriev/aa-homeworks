import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './components/widget';
import store from './store';

document.addEventListener("DOMContentLoaded", function(){
  console.log('loaded');
  ReactDOM.render(<Widget store={store} />, document.getElementById('root'));
});
