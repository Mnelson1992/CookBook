
$(document).ready(function(){
  showComments()
  formSubmit()
})

function showComments() {
  $('#showComments').on('click', function(){
    const id = $(this).data('id')
    $.get(`http://localhost:3000/recipes/${id}/comments.json`, function(data){
      data.forEach(function(comment){
        $('#comments_list').append(`<li><em>"${comment.body}"</em> -- "${comment.user}"</li>`)
      })
    })
  })
}

function formSubmit() {
  $('form').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();
    console.log("Hello")
    var values = $(this).serialize();
    var recipeId = parseInt(document.getElementById('showComments').name, 10)
    var posting = $.post('/recipes/' + recipeId + '/comments', values);
    posting.done(function(data) {
      var recipe = data;
      $("#commentBody").text(recipe["body"]);
    });
  });
}
