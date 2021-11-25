import "jquery-bar-rating";

const initStarRating = () => {
  $('#game_review_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
