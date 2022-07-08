import React from 'react';
import { useSelector, useDispatch } from 'react-redux';

import { getPosts } from '../redux/Posts/post';

const Post = () => {
  const dispatch = useDispatch();
  const post = useSelector((state) => state.post);

  return (
    <div>
      Post:
      <button className="getPostsBtn" onClick={() => dispatch(getPosts())}>
        Scrape
      </button>
      <br />
      <span>{post.post}</span>
      <span>{post.link}</span>
      <span>{post.createdTime}</span>
    </div>
  );
};

export default Post;
