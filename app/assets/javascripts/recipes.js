//set up the document ready function
$(document).ready(function(){

  $('#ingredients').on('click', function(){
    const id = $(this).data('id')
    //console.log(id)
    $.get(`http://localhost:3000/recipes/${id}/ingredients.json`, function(data){
      data.forEach(function(ingredient){
        $('#ingredients_list').append(`<li>${ingredient.name}</li>`)
      })

    })
  })




})
