$(document).ready(function(){

  $('#showComments').on('click', function(){
    const id = $(this).data('id')
    $.get(`http://localhost:3000/recipes/${id}/comments.json`, function(data){
      data.forEach(function(comment){
        $('#comments_list').append(`<li>${comment.body}</li>`)
      })
    })
  })

  


})
