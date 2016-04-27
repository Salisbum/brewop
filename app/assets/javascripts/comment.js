$(function() {

  $(function() {
    $('.button_to').click(function(event) {
      event.preventDefault();

      var element = event.target;
      var targetUrl = $(this).attr('action');

      $.ajax({
        method: "DELETE",
        url: targetUrl,
        dataType: "json"
      }).done(function(data) {
        $(element).parent().parent().remove();
      });
    });
  });

  $('.edit').click(function(){
     $(this).parent().find('.update-form').toggle();
  });

  // $('form.edit_comment').submit(function(event){
  //   event.preventDefault();
  //   var commentId = $(this).find('#comment_id').val();
  //   var targetUrl = $(this).attr('action');
  //   var newCommentContent = $(this).find('#comment_body').val();
  //   var newComment = {
  //     comment: {
  //       id: commentId,
  //       body: newCommentContent
  //     }
  //   };
  //
  //   var request = $.ajax({
  //     method: "PUT",
  //     data: newComment,
  //     url: targetUrl
  //   });
  //
  //   request.done(function(data) {
  //     $("div#comment-"+commentId).find('span').text(newCommentContent);
  //     $("div#comment-"+commentId).find('.update-form').toggle();
  //   });
  // });

  $('.new').click(function(){
    $(this).parent().find('.add-comment').toggle();
  });

  // $("form#new_comment").submit(function(event) {
  //   event.preventDefault();
  //   var targetUrl = $(this).attr('action');
  //   var newCommentContent = $('#comment_body').val();
  //   var newComment = {
  //     comment: {
  //       body: newCommentContent
  //     }
  //   };
  //
  //   var request = $.ajax({
  //     method: "POST",
  //     data: newComment,
  //     url: targetUrl
  //   });
  //
  //   request.done(function(data) {
  //     var html = "<div class='callout success'>" +
  //         newCommentContent +
  //       "</div>";
  //
  //     $("div.comments").prepend(html);
  //     $('#comment_body').val("");
  //   });
  // });
});
