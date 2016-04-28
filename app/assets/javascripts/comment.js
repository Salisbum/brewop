$(document).ready(function() {

    $(".delete-comment").click(function(event) {
      event.preventDefault();
      
      var element = event.target;
      var targetUrl = $(this).parent().attr("action");

      var request = $.ajax({
        method: "DELETE",
        url: targetUrl,
        dataType: "json"
      });

      request.done(function(data) {
        $(element).parent().parent().remove();
      });
    });
//
//   $(".edit-comment").click(function(){
//      $(this).parent().find(".update-form").toggle();
//   });
//
//   $('form.edit_comment').submit(function(event){
//     event.preventDefault();
//     var commentId = $(this).find('#comment_id').val();
//     var targetUrl = $(this).attr('action');
//     var newCommentContent = $(this).find('#comment_body').val();
//     var newComment = {
//       comment: {
//         id: commentId,
//         body: newCommentContent
//
//       }
//     };
//
//     var request = $.ajax({
//       method: "PUT",
//       data: newComment,
//       url: "/api" + targetUrl
//     });
//
//     request.done(function() {
//       $("div#comment-"+commentId).find('span').text(newCommentContent);
//       $("div#comment-"+commentId).find('.update-form').toggle();
//     });
//   });
//
  $('.new-comment').click(function(event){
    event.preventDefault();
    $(this).parent().find('.add-comment').toggle();
  });

  $("form#new_comment").submit(function(event) {
    event.preventDefault();
    var targetUrl = $(this).attr('action');
    var newCommentContent = $('#comment_body').val();
    var newComment = {
      comment: {
        body: newCommentContent
      }
    };

    var request = $.ajax({
      method: "POST",
      data: newComment,
      dataType: "json",
      url: "/api" + targetUrl
    });

    request.done(function(data) {
      var html = "<div class='callout success' id='newest-comment'>" +
          data.comment.body +
        "</div>";

      $("div.comments").prepend(html);
      $('#comment_body').val("");
    });
  });
});
