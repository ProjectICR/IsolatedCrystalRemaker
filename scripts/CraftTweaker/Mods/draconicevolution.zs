#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import scripts.grassUtils.RecipeUtils;

var bloodOrb as IItemStack = <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"});

var shapedRecipes as IIngredient[][][IItemStack] = {
    <draconicevolution:draconic_core> : [
        [<bloodmagic:item_demon_crystal>, <botania:manaresource:8>, <bloodmagic:item_demon_crystal>],
        [<bloodmagic:lava_crystal>, <ore:blockElectrum>, <bloodmagic:lava_crystal>],
        [<draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>]
    ],

    <draconicevolution:wyvern_core> : [
        [<ore:ingotSignalum>, <botania:manaresource:9>, <ore:ingotSignalum>],
        [<mekanism:atomicalloy>, <minecraft:nether_star>, <mekanism:atomicalloy>],
        [<draconicevolution:draconic_core>, <draconicevolution:draconic_core>, <draconicevolution:draconic_core>]
    ],

    <draconicevolution:awakened_core> : [
        [<mekanism:ingot>, <contenttweaker:block_nether_star>, <mekanism:ingot>],
        [bloodOrb, <draconicevolution:draconic_block>, bloodOrb],
        [<draconicevolution:wyvern_core>, <draconicevolution:wyvern_core>, <draconicevolution:wyvern_core>]
    ],

    <draconicevolution:chaotic_core> : [
        [<extrautils2:compressedcobblestone:5>, <draconicevolution:chaos_shard>, <extrautils2:compressedcobblestone:5>],
        [<contenttweaker:cesium_ingot>, <ore:blockBeryllium>, <contenttweaker:cesium_ingot>],
        [<draconicevolution:awakened_core>, <draconicevolution:awakened_core>, <draconicevolution:awakened_core>]
    ],

    <draconicevolution:wyvern_energy_core> : [
        [<contenttweaker:cesium_tiny_dust_icr>, <contenttweaker:ingot_redstonedragon>, <contenttweaker:cesium_tiny_dust_icr>],
        [<enderio:item_basic_capacitor:2>, <mekanism:controlcircuit:3>, <enderio:item_basic_capacitor:2>],
        [<contenttweaker:cesium_tiny_dust_icr>, <contenttweaker:ingot_redstonedragon>, <contenttweaker:cesium_tiny_dust_icr>]
    ]
};

for output, inputBox in shapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}