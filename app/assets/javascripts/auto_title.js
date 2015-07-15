$(function() {
  var $link = $('#bookmark_link');
  var $action = $('form').attr('action');
  console.log($action)

  $link.on('input', function() {
    var link = this.value;

    $.ajax({
      type: 'POST',
      url: $action,
      data: $.param({ url: link })
    });
  });
});
