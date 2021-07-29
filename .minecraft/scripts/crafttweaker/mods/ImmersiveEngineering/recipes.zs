#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import scripts.grassUtils.RecipeUtils;


var shapedRecipes as IIngredient[][][IItemStack] = {
    <immersiveengineering:stone_decoration> : [
        [<tconstruct:soil>, <ore:plateWroughtiron>, <tconstruct:soil>],
        [<ore:plateWroughtiron>, <tconstruct:materials>, <ore:plateWroughtiron>],
        [<tconstruct:soil>, <ore:plateWroughtiron>, <tconstruct:soil>]
    ],

    <immersiveengineering:metal_device1:3> : [
        [<ore:ingotSteel>, <immersiveengineering:wirecoil>, <ore:ingotSteel>],
        [<ore:ingotCopper>, <ore:rotorWroughtiron>, <ore:ingotAluminium>],
        [<ore:ingotSteel>, <ore:plankTreatedWood>, <ore:ingotSteel>]
    ]
};

for output, inputBox in shapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}