#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import scripts.grassUtils.RecipeUtils;


var shapelessRecipes as IIngredient[][IItemStack] = {
    <forestry:fertilizer_compound> * 3 : [
        <minecraft:dye:15>, <enderio:item_material:46> * 3
    ]
};


for output, inputBox in shapelessRecipes {
    RecipeUtils.recipeTweak(false, output, [inputBox]);
}