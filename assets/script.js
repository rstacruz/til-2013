/*
 * Next article backgrounds
 */

!(function () {
  var articles = document.querySelectorAll('.next-article')
  for (var i = 0; i < articles.length; i++) {
    var article = articles[i]
    var id = article.getAttribute('data-id')
    var n = (hashify(id) % 6) + 1
    article.className += ' -v' + n
  }

  function hashify(str) {
    var hash = 0, i, chr, len
    if (str.length === 0) return hash
    for (i = 0, len = str.length; i < len; i++) {
      chr   = str.charCodeAt(i)
      hash  = ((hash << 5) - hash) + chr
      hash |= 0
    }
    return Math.abs(hash)
  }
})()

/*
 * Unorphan
 */

!(function () {
  unorphan('h1, h2, h3, p, li, .unorphan')
})()

/*
 * Syntax highlight
 */

!(function () {
  // hljs.initHighlightingOnLoad()
  Prism.highlightAll()
})()
