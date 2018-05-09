//set up the document ready function
$(document).ready(function(){

  $('#ingredients').on('click', function(){
    const id = $(this).data('id')
    $.get(`http://localhost:3000/recipes/${id}/ingredients.json`, function(data){
      data.forEach(function(ingredient){
        const ing = new Ingredient(ingredient)
        $('#ingredients_list').append(ing.render())
      })
    })
  })


function Ingredient(json){
  this.name = json.name
  this.quantity = json.ing_quantity
}

Ingredient.prototype.render = function() {
  return `<li>${this.name} -- ${this.quantity}</li>`
}



})
