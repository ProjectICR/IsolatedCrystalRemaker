#loader crafttweaker
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

import scripts.grassUtils.RecipeUtils;

var ShapedRecipes as IIngredient[][][IItemStack] = {
    <minecraft:gravel> : [
        [<ore:pebble>, <ore:cobblestone>],
        [<ore:cobblestone>, <ore:pebble>]
    ],

    <minecraft:blaze_rod> : [
        [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>],
        [<minecraft:blaze_powder>, <minecraft:stick>, <minecraft:lava_bucket>]
    ]
};

for output, inputBox in ShapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}

recipes.addShaped("recipe_shares_time", <minecraft:shears>, [
    [null, <ore:plankWood>],
    [<ore:plankWood>, null]
], function(out, ins, cInfo) {
    var data as IData = cInfo.player.data.PlayerPersisted;
    if(!isNull(data.shares_time) && data.shares_time.asInt() >= 3) {
        return null;
    }
    return cInfo.player.health > 19.5 ? out : null;
}, function(out, cInfo, player) {
    var data as IData = player.data.PlayerPersisted;
    if(!player.world.remote) {
        player.health -= 19.5;
        if(isNull(data.shares_time)) {
            player.update({PlayerPersisted : {shares_time : 1}});
        } else {
            player.update({PlayerPersisted : {shares_time : data.shares_time.asInt() + 1}});
        }
    }
});

<minecraft:sapling>.addTooltip("§a你知道吗：橡树树苗非常讨厌在炼药锅的附近。");

mods.integrateddynamics.Squeezer.removeRecipesWithOutput(null, <liquid:lava>);
mods.integrateddynamics.MechanicalSqueezer.removeRecipesWithOutput(null, <liquid:lava>);

//烈焰棒合成
mods.integrateddynamics.MechanicalSqueezer.addRecipe(<minecraft:blaze_powder> * 9, <minecraft:blaze_rod>, null, 200);

mods.immersiveengineering.MetalPress.addRecipe(<minecraft:blaze_rod>, <minecraft:blaze_powder>, <immersiveengineering:mold:2>, 1500, 3);

mods.thermalexpansion.Compactor.removePressRecipe(<minecraft:blaze_powder>);
mods.thermalexpansion.Compactor.addStorageRecipe(<minecraft:blaze_rod>, <minecraft:blaze_powder> * 2, 800);

mods.tconstruct.Casting.addBasinRecipe(<minecraft:netherrack>, <ore:cobblestone>, <fluid:lava>, 500, true, 400);