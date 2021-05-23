#loader crafttweaker
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import scripts.grassUtils.RecipeUtils;


var shapedRecipes as IIngredient[][][IItemStack] = {
    <enderio:item_basic_capacitor> : [
        [<ore:dustIron>, <ore:nuggetCopper>, <ore:dustRedstone>],
        [<ore:nuggetCopper>, <ore:ingotLead>, <ore:nuggetCopper>],
        [<ore:dustRedstone>, <ore:nuggetCopper>, <ore:dustLapis>]
    ],

    <enderio:item_basic_capacitor:1> : [
        [<ore:dustNetherQuartz>, <enderio:item_alloy_ingot:1>, <ore:dustNetherQuartz>],
        [<enderio:item_basic_capacitor>, <ore:dustHOPGraphite>, <enderio:item_basic_capacitor>],
        [<ore:dustNetherQuartz>, <enderio:item_alloy_ingot:1>, <ore:dustNetherQuartz>]
    ],

    <enderio:item_basic_capacitor:2> : [
        [<ore:dustGlowstone>, <enderio:item_alloy_ingot:2>, <ore:dustGlowstone>],
        [<enderio:item_basic_capacitor:1>, <ore:ingotEnderium>, <enderio:item_basic_capacitor:1>],
        [<ore:dustGlowstone>, <enderio:item_alloy_ingot:2>, <ore:dustGlowstone>]
    ],

    <enderio:block_slice_and_splice> : [
        [<enderio:item_alloy_ingot:7>, <minecraft:skull:*>, <enderio:item_alloy_ingot:7>],
        [<enderio:item_alloy_ingot:7>, <enderio:item_material:1>, <enderio:item_alloy_ingot:7>],
        [<ore:gearCopper>, <thermalfoundation:material:513>, <ore:gearCopper>]
    ],

    <enderio:block_painter> : [
        [<ore:gemDiamond>, <openblocks:imaginary>.withTag({Uses: 10.0 as float, Mode: 0}), <ore:gemDiamond>],
        [<enderio:item_alloy_ingot>, <enderio:item_material:1>, <enderio:item_alloy_ingot>],
        [<thermalfoundation:material:290>, <thermalfoundation:material:513>, <thermalfoundation:material:290>]
    ]
};


for output, inputBox in shapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}

<ore:blockGlassHardened>.remove(<enderio:block_fused_quartz>);