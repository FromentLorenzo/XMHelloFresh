// Fonction pour afficher les détails de la recette
function displayRecipe(recipeData) {
    // Div contenant les détails de la recette
    var recipeContainer = document.getElementById('recipeContainer');
  
    // Séparer les données de la recette
    var recipeDetails = recipeData.split('|');
  
    // Afficher les détails dans la div
    recipeContainer.innerHTML = '<h2>' + recipeDetails[0] + '</h2>' +
      '<p>ID: ' + recipeDetails[1] + '</p>' +
      '<p>Ingrédient: ' + recipeDetails[2] + '</p>' +
      '<img src="' + recipeDetails[3] + '" alt="Image de la recette">';
  }
  