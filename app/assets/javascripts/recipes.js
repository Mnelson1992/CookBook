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

$(".nextRecipe").on("click", function(event) {
    event.preventDefault()
    var nextId = parseInt($(this).attr("data-id")) + 1;
    $.get("http://localhost:3000/recipes/" + nextId + ".json", function(data) {
      var recipe = data;
      $(".recipeName").text(recipe["name"]);
      $(".recipeInstructions").text(recipe["instructions"]);
      $(".recipeCooktime").text(recipe["cooktime"]);
      // re-set the id to current on the link
      $(".nextRecipe").attr("data-id", recipe["id"]);
    });
  });



})
