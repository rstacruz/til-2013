(function() {
  var articles = document.querySelectorAll('.next-article');
  for (var i = 0; i < articles.length; i++) {
    var article = articles[i];
    var n = (Math.random()*6)|0+1;
    article.className += ' -v' + n;
  }
})();
