#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;


import mods.botania.ManaInfusion;

import scripts.grassUtils.RecipeUtils;


var livingrock as IItemStack = <botania:livingrock>;

var shapedRecipes as IIngredient[][][IItemStack] = {
    <botania:runealtar> : [
        [null, <minecraft:blaze_rod>, null],
        [livingrock, livingrock, livingrock],
        [livingrock, <botania:manaresource:1>|<botania:manaresource:2>, livingrock]
    ],

    <botania:alchemycatalyst> : [
        [livingrock, <ore:ingotGold>, livingrock],
        [<minecraft:brewing_stand>, <extrautils2:compressedsand:1>, <minecraft:brewing_stand>],
        [livingrock, <ore:ingotGold>, livingrock]
    ],

    <botania:rfgenerator> : [
        [livingrock, <enderio:block_alloy:3>, livingrock],
        [<botania:storage>, <immersiveengineering:metal_decoration0:6>, <botania:storage>],
        [livingrock, <enderio:block_alloy:3>, livingrock]
    ]
};

var shapelessRecipes as IIngredient[][][IItemStack] = {
    <botania:manaresource:12> : [
        [<botania:manaresource:16>, <botania:manaresource:8>, <ore:blockSignalum>, <ore:ingotEnderium>, <ore:ingotEnderium>, <botania:felpumpkin>]
    ]
};


for output, inputBox in shapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}


for output, inputBox in shapelessRecipes {
    RecipeUtils.recipeTweak(false, output, inputBox);
}