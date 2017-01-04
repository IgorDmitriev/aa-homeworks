import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';


const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState, applyMiddleware(addLoggingDispatch));

  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;

const addLoggingDispatch = store => next => action => {
  console.log('Old state:', store.getState());
  console.log('Action:', action);
  let result = next(action);
  console.log('New state:', store.getState());
  return result;
};
