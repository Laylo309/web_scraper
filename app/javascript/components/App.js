import React from 'react';

import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { Provider } from 'react-redux';
import Post from './Post';
import store from '../redux/configureStore';

const App = () => {
  return (
    <Provider store={store}>
      <BrowserRouter>
        <Routes>
          <Route exact path="/" element={'Home!'} />
          <Route path="/posts" element={<Post />} />
        </Routes>
      </BrowserRouter>
    </Provider>
  );
};

export default App;
