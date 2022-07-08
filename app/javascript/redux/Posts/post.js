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
  try {
    await fetch(URL, {
      Method: 'POST',
      Headers: {
        Accept: 'application.json',
        'Content-Type': 'application/json',
      },
      Body: body,
      Cache: 'default',
    });
    let response = await (await fetch('http://localhost:3000/v1/posts'));
    console.log(response);
    dispatch(getPostsSuccess(response));
  } catch (error) {}
};

function rootReducer(state = initialState, action) {
  switch (action.type) {
    case GET_POSTS_SUCCESS:
      return { ...state, posts: { ...state.posts, ...action.payload } };
    default:
      return state;
  }
}

export default rootReducer;
