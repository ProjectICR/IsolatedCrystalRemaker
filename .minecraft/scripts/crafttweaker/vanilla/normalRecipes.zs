#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.tconstruct.Casting;
import mods.thermalexpansion.Compactor;
import mods.integrateddynamics.Squeezer;
import mods.immersiveengineering.MetalPress;
import mods.integrateddynamics.MechanicalSqueezer;
import mods.botania.ManaInfusion;

import scripts.grassUtils.RecipeUtils;


var shapedRecipes as IIngredient[][][IItemStack] = {
    <minecraft:gravel> : [
        [<ore:pebble>, <ore:cobblestone>],
        [<ore:cobblestone>, <ore:pebble>]
    ],

    <minecraft:blaze_rod> : [
        [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>],
        [<minecraft:blaze_powder>, <minecraft:stick>, <minecraft:lava_bucket>]
    ]
};


for output, inputBox in shapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}


Squeezer.removeRecipesWithOutput(null, <liquid:lava>);
MechanicalSqueezer.removeRecipesWithOutput(null, <liquid:lava>);

Casting.addBasinRecipe(<minecraft:netherrack>, <ore:cobblestone>, <fluid:lava>, 500, true, 400);

MechanicalSqueezer.addRecipe(<minecraft:blaze_powder> * 9, <minecraft:blaze_rod>, null, 200);

MetalPress.addRecipe(<minecraft:blaze_rod>, <minecraft:blaze_powder>, <immersiveengineering:mold:2>, 1500, 3);

Compactor.removePressRecipe(<minecraft:blaze_powder>);
Compactor.addStorageRecipe(<minecraft:blaze_rod>, <minecraft:blaze_powder> * 2, 800);

ManaInfusion.addAlchemy(<minecraft:double_plant>, <botania:petal:4> * 4, 150);