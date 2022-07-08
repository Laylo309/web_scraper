import React from 'react';
import { useSelector, useDispatch } from 'react-redux';

import { getPosts } from '../redux/Posts/post';

const Post = () => {
  const dispatch = useDispatch();
  const { posts } = useSelector((state) => state.post);

  return (
    <div>
      Post:
      <button className="getPostsBtn" onClick={() => dispatch(getPosts())}>
        Scrape
      </button>
      <br />
      { posts.map((post, id) => {
        return (<ul key={id} style={{display:'flex', flexDirection: 'column'}}>
          <li>Title: <span>{post.title}</span></li>
          <li>Link: <a href={post.link}>Visit Website</a></li>
          <li>Date: <span>{post.created_time}</span></li>
        </ul>)
      }) }
    </div>
  );
};

export default Post;