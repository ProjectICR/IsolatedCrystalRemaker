#priority 100
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

function getItemRecipeNameWithUnderline(item as IItemStack) as string {
    if(isNull(item)) return "Invalid";
    var id as string = item.definition.id.split(":")[1];
    var meta as int = item.metadata;
    return (meta == 0) ? id : (id + "_" + meta);
}

function addShapedRecipe(recipeBox as IIngredient[][][IItemStack]) as bool {
    for out, inputBox in recipeBox {
        recipes.addShaped(getItemRecipeNameWithUnderline(out), out, inputBox);
    }
}

function addShapelessRecipe(recipeBox as IIngredient[][IItemStack]) as bool {
    for out, inputBox in recipeBox {
        recipes.addShapeless(getItemRecipeNameWithUnderline(out), out, inputBox);
    }
}