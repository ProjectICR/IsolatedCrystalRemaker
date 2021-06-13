#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.recipes.ICraftingInventory;

import scripts.grassUtils.StringHelper.getItemNameWithUnderline;
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

static ingotToRotor as string[] = [
    "Castediron",
    "Wroughtiron",
];


recipes.addShaped(getItemNameWithUnderline(<contenttweaker:ambient_block>), <contenttweaker:ambient_block>, [
    [<ore:livingrock>, null, <ore:livingrock>],
    [<ore:ingotManasteel>, <botania:manatablet>.withTag({mana: 1000}, false).marked("manatablet").reuse() , <ore:ingotManasteel>],
    [<ore:livingwood>, null, <ore:livingwood>]
], function(out, ins, cInfo) {
    return !isNull(ins.manatablet.tag.mana) && ins.manatablet.tag.mana >= 1000 ? out : null;
}, function(out, cinfo, player) {
    if(!player.world.remote) {
        var inventory as ICraftingInventory = cinfo.inventory;
        var item as IItemStack = inventory.getStack(4);
        
        inventory.setStack(4, item.withTag({mana : item.tag.mana.asInt() - 1000}));
    }
});


for oreName in ingotToRotor {
    var plate as IOreDictEntry = oreDict.get("plate" ~ oreName);
    var ingot as IOreDictEntry = oreDict.get("ingot" ~ oreName);
    var rotor as IOreDictEntry = oreDict.get("rotor" ~ oreName);

    recipes.addShaped(getItemNameWithUnderline(rotor.firstItem), rotor.firstItem, [
        [null, plate, null],
        [plate, ingot, plate],
        [null, plate, null]
    ]);
}


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
    mods.ic2.Macerator.addRecipe(dust.firstItem, ingot);
    mods.mekanism.crusher.addRecipe(ingot, dust.firstItem);
    mods.extrautils2.Crusher.add(dust.firstItem, ingot.firstItem);
    mods.enderio.SagMill.addRecipe([dust.firstItem], [100], ingot);
    mods.appliedenergistics2.Grinder.addRecipe(dust.firstItem, ingot, 1);

    mods.ic2.MetalFormer.addRollingRecipe(plate.firstItem, ingot);
    mods.ic2.BlockCutter.addRecipe(plate.firstItem * 9, block, 1);
    mods.thermalexpansion.Compactor.addPressRecipe(densePlate.firstItem, plate.firstItem * 9, energy);
}