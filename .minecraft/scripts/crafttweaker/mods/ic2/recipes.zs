#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.naturesaura.TreeRitual;

import scripts.grassUtils.RecipeUtils;
import scripts.grassUtils.StringHelper.getItemNameWithUnderline;

var shapedRecipes as IIngredient[][][IItemStack] = {
    <ic2:refractory_bricks> * 4 : RecipeUtils.createCrossWithCore(<ore:ingotIron>, <minecraft:clay_ball>, <ore:ingotBrick>)
};


TreeRitual.addRecipe(getItemNameWithUnderline(<ic2:sapling>), <minecraft:sapling>, <ic2:sapling>, 200, [
    <ore:slimeball>, <ore:slimeball>, <ore:slimeball>, <ore:slimeball>
]);


for output, inputBox in shapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}