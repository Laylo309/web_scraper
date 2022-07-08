const GET_POSTS_SUCCESS = 'GET_POSTS_SUCCESS';

const URL = 'http://localhost:3000/v1/posts/scrape';

const initialState = {
  posts: [],
};

export function getPostsSuccess(payload) {
  return {
    type: GET_POSTS_SUCCESS,
    payload,
  };
}

export const getPosts = () => async (dispatch) => {
  await fetch(URL, {
    method: 'POST',
    headers: { 'Content-type': 'application/json; charset=UTF-8' },
  });
  let response = await fetch('http://localhost:3000/v1/posts');
  let json = await response.json();
  dispatch(getPostsSuccess(json));
};

function rootReducer(state = initialState, action) {
  switch (action.type) {
    case GET_POSTS_SUCCESS:
      return { ...state, posts: [...action.payload.posts] };
    default:
      return state;
  }
}

export default rootReducer;
