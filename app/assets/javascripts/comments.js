
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
        let bodyA = a.body.toUpperCase(); // ignore upper and lowercase
        let bodyB = b.body.toUpperCase()
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
  $('#comment_form').submit(function(event) {

    //prevent form from submitting the default way
    event.preventDefault();
    let values = $(this).serialize();
    let recipeId = parseInt(document.getElementById('showComments').name, 10)
    let posting = $.post('/recipes/' + recipeId + '/comments', values);
    posting.done(function(recipe) {
      $("#commentBody").text(recipe["body"]);
    });
  });
}
