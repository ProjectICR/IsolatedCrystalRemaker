#loader crafttweaker
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.damage.IDamageSource;

import mods.thermalexpansion.Compactor;
import mods.integrateddynamics.MechanicalSqueezer;
import mods.integrateddynamics.Squeezer;
import mods.immersiveengineering.MetalPress;
import mods.tconstruct.Casting;

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
        player.attackEntityFrom(IDamageSource.createPlayerDamage(player), 19.5);

        if(isNull(data.shares_time)) {
            player.update({PlayerPersisted : {shares_time : 1}});
        } else {
            player.update({PlayerPersisted : {shares_time : data.shares_time.asInt() + 1}});
        }
    }
});

Squeezer.removeRecipesWithOutput(null, <liquid:lava>);
MechanicalSqueezer.removeRecipesWithOutput(null, <liquid:lava>);

mods.tconstruct.Casting.addBasinRecipe(<minecraft:netherrack>, <ore:cobblestone>, <fluid:lava>, 500, true, 400);

//烈焰棒合成
MechanicalSqueezer.addRecipe(<minecraft:blaze_powder> * 9, <minecraft:blaze_rod>, null, 200);

MetalPress.addRecipe(<minecraft:blaze_rod>, <minecraft:blaze_powder>, <immersiveengineering:mold:2>, 1500, 3);

Compactor.removePressRecipe(<minecraft:blaze_powder>);
Compactor.addStorageRecipe(<minecraft:blaze_rod>, <minecraft:blaze_powder> * 2, 800);