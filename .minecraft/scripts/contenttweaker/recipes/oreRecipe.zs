#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;

import mods.ic2.Macerator;
import mods.ic2.MetalFormer;
import mods.ic2.BlockCutter;
import mods.enderio.SagMill;
import mods.mekanism.crusher;
import mods.extrautils2.Crusher;
import mods.thermalexpansion.Compactor;
import mods.appliedenergistics2.Grinder;

import scripts.grassUtils.RecipeUtils.createCross;
import scripts.grassUtils.RecipeUtils.createFull3;

var materials as int[string] = {
    "Cesium" : 3000,
    "Indium" : 5000,
    "Titanium" : 8000,
    "Beryllium" : 2000,
    "Germanium" : 3000,
    "Zirconium" : 4000,
    "Soldertin" : 1200,
    "Adamantium" : 10000,
    "Stainlesstitanium" : 5000,
    "Berylliumaluminumalloy" : 4500
};


for material, energy in materials {
    var materialNew as string = material.toLowerCase();
    var rod as IOreDictEntry = oreDict.get("rod" ~ material);
    var dust as IOreDictEntry = oreDict.get("dust" ~ material);
    var gear as IOreDictEntry = oreDict.get("gear" ~ material);
    var block as IOreDictEntry = oreDict.get("block" ~ material);
    var ingot as IOreDictEntry = oreDict.get("ingot" ~ material);
    var plate as IOreDictEntry = oreDict.get("plate" ~ material);
    var nugget as IOreDictEntry = oreDict.get("nugget" ~ material);
    var densePlate as IOreDictEntry = oreDict.get("densePlate" ~ material);
    var smallDust as IOreDictEntry = oreDict.get("dustSmall" ~ material);
    var tinyDust as IOreDictEntry = oreDict.get("tinyDustIcr" ~ material);

    recipes.addShapeless("block_" ~ materialNew ~ "_to_ingot", ingot.firstItem * 9, [block]);
    recipes.addShapeless("ingot_" ~ materialNew ~ "_to_nugget", nugget.firstItem * 9, [ingot]);
    recipes.addShapeless("dust_" ~ materialNew ~ "_to_small_dust", smallDust.firstItem * 9, [dust]);

    recipes.addShaped("ingot_" ~ materialNew ~ "_to_block", block.firstItem, createFull3(ingot));
    recipes.addShaped("nugget_" ~ materialNew ~ "_to_ingot", ingot.firstItem, createFull3(nugget));
    recipes.addShaped("ingot_" ~ materialNew ~ "_to_gear", gear.firstItem, createCross(null, ingot));
    recipes.addShaped("small_dust" ~ materialNew ~ "_to_dust", dust.firstItem, createFull3(smallDust));

    recipes.addShaped("ingot_" ~ materialNew ~ "_to_plate", plate.firstItem, [
        [ingot, <ic2:forge_hammer>|<immersiveengineering:tool>],
        [ingot]
    ]);

    recipes.addShaped("ingot_" ~ materialNew ~ "_to_rod", rod.firstItem * 4, [
        [ingot],
        [ingot]
    ]);

    recipes.addShaped("tiny_dust" ~ materialNew ~ "_to_small_dust", smallDust.firstItem, [
        [null, tinyDust, null],
        [tinyDust, tinyDust, tinyDust],
        [null, tinyDust, null]
    ]);

    furnace.addRecipe(ingot.firstItem, dust);
    Macerator.addRecipe(dust.firstItem, ingot);
    crusher.addRecipe(ingot, dust.firstItem);
    Crusher.add(dust.firstItem, ingot.firstItem);
    SagMill.addRecipe([dust.firstItem], [100], ingot);
    Grinder.addRecipe(dust.firstItem, ingot, 1);

    MetalFormer.addRollingRecipe(plate.firstItem, ingot);
    BlockCutter.addRecipe(plate.firstItem * 9, block, 1);
    Compactor.addPressRecipe(densePlate.firstItem, plate.firstItem * 9, energy);
}