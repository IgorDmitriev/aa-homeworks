import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // store = applyMiddlewares(store, addLoggingDispatch);

  //Add middleware
  // store.dispatch = addLoggingDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});



// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//
//   middlewares.forEach( m => {
//     dispatch = m(store)(dispatch);
//   });
//
//   return Object.assign({}, store, { dispatch });
// };
