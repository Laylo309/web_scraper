import { createStore, applyMiddleware, combineReducers } from 'redux';

import thunk from 'redux-thunk';
import rootReducer from './Posts/post';

const reducer = combineReducers({
  post: rootReducer,
});

const store = createStore(reducer, applyMiddleware(thunk));
export default store;
