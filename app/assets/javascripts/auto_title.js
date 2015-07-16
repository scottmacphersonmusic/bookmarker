function onTitleRetrievalSuccess(data, status, xhr) {
  // $(#bookmark_title).val(data);
  console.log(data);
}

function path(name) {
  return $("#routes #" + name).text();
}

function retrieveTitleSuggestion() {
  var link = this.value;
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
