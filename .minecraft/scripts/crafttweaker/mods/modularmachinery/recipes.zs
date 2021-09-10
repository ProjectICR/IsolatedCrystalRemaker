#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import scripts.grassUtils.RecipeUtils;


var shapedRecipes as IIngredient[][][IItemStack] = {
    <modularmachinery:itemmodularium> * 4 : [
        [<ore:dustRedstone>, <ore:ingotIron>, <ore:dustRedstone>],
        [<ore:ingotGold>, <ore:dustRedstone>, <ore:ingotGold>],
        [<ore:dustRedstone>, <ore:ingotIron>, <ore:dustRedstone>]
    ]
};


for output, inputBox in shapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}