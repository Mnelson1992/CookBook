
$(document).ready(function(){
  showComments()
  formSubmit()
})

function showComments() {
  $('#showComments').on('click', function(){
   $('#comments_list').html('')
    const id = $(this).data('id')
    $.get(`http://localhost:3000/recipes/${id}/comments.json`, function(data){
      data.sort(function (a, b){
        var bodyA = a.body.toUpperCase(); // ignore upper and lowercase
        var bodyB = b.body.toUpperCase()
          if (bodyA < bodyB) {
            return -1;
          }
          if (bodyA > bodyB) {
            return 1;
          }
          return 0;
      })
      data.forEach(function(comment){
        $('#comments_list').append(`<li><em>"${comment.body}"</em></li>`)
      })
    })
  })
}

function formSubmit() {
  $('form').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();
    const values = $(this).serialize();
    const recipeId = parseInt(document.getElementById('showComments').name, 10)
    const posting = $.post('/recipes/' + recipeId + '/comments', values);
    posting.done(function(recipe) {
      $("#commentBody").text(recipe["body"]);
    });
  });
}
