$(function() {
  var $link = $('#bookmark_link')

  $link.on('input', function() {
    var link = this.value;
    console.log(link);
  })
})
;
