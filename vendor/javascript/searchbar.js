document.addEventListener('DOMContentLoaded', function() {
  var searchForm = document.querySelector('.my-search-form');
  var searchInput = searchForm.querySelector('input[type="text"]');

  searchInput.addEventListener('click', function() {
    searchForm.classList.add('search-expanded');
  });

  document.addEventListener('click', function(e) {
    if (!searchForm.contains(e.target)) {
      searchForm.classList.remove('search-expanded');
    }
  });
});