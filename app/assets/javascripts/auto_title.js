function onTitleRetrievalSuccess(data, status, xhr) {
  $("#bookmark_title").val(data["title"] || data["error"]);
}

function path(name) {
  return $("#routes #" + name).text();
}

function retrieveTitleSuggestion() {
  var link = encodeURI(this.value);
  var url = path('autotitle_create_path');

  $.ajax({
    type: 'POST',
    url: url,
    data: $.param({ url: link }),
    success: onTitleRetrievalSuccess
  });
}

$(function() {
  $('#bookmark_link').on('input', retrieveTitleSuggestion);
});
