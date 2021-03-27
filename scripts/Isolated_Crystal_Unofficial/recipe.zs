#loader crafttweaker
import crafttweaker.item.IItemStack;

function getItemRecipeNameWithUnderline(item as IItemStack) as string {
    if(isNull(item)) return "Invalid";
    var id as string = item.definition.id.split(":")[1];
    var meta as int = item.metadata;
    return (meta == 0) ? id : (id + "_" + meta);
}

var ingotNames as int[string] = {
    "ingot_cesium" : 3000,
    "ingot_indium" : 5000,
    "ingot_titanium" : 8000,
    "ingot_beryllium" : 2000,
    "ingot_germanium" : 3000,
    "ingot_zirconium" : 4000,
    "ingot_solder_tin" : 1200,
    "ingot_adamantium" : 10000,
};

for itemName, energy in ingotNames {
    var ingot as IItemStack = itemUtils.getItem("contenttweaker" + ":" + itemName);
    var dust as IItemStack = itemUtils.getItem("contenttweaker" + ":" + itemName.replace("ingot", "dust"));
    var block as IItemStack = itemUtils.getItem("contenttweaker" + ":" + itemName.replace("ingot", "block"));
    var nugget as IItemStack = itemUtils.getItem("contenttweaker" + ":" + itemName.replace("ingot", "nugget"));

    if(itemName in "indium" || itemName in "cesium") {
        var smallDust as IItemStack = itemUtils.getItem("contenttweaker" + ":" + itemName.replace("ingot", "small_dust"));
        var tinyDust as IItemStack = itemUtils.getItem("contenttweaker" + ":" + itemName.replace("ingot", "tiny_dust"));
        recipes.addShapeless(getItemRecipeNameWithUnderline(smallDust), smallDust * 9, [dust]);
        recipes.addShaped("small_dust_to_" ~ getItemRecipeNameWithUnderline(dust), dust, [
            [smallDust, smallDust, smallDust],
            [smallDust, smallDust, smallDust],
            [smallDust, smallDust, smallDust]
        ]);
        recipes.addShaped("tiny_dust_to_" ~ getItemRecipeNameWithUnderline(smallDust), smallDust, [
            [null, tinyDust, null],
            [tinyDust, tinyDust, tinyDust],
            [null, tinyDust, null]
        ]);
    }

    if(!isNull(nugget)) {
        recipes.addShapeless(getItemRecipeNameWithUnderline(nugget), nugget * 9, [ingot]);
        recipes.addShaped(getItemRecipeNameWithUnderline(ingot), ingot, [
            [nugget, nugget, nugget],
            [nugget, nugget, nugget],
            [nugget, nugget, nugget]
        ]);
    }

    furnace.addRecipe(ingot, dust);
    mods.ic2.Macerator.addRecipe(dust, ingot);
    mods.extrautils2.Crusher.add(dust, ingot);
    mods.mekanism.crusher.addRecipe(ingot, dust);
    mods.enderio.SagMill.addRecipe([dust], [100], ingot);
    mods.appliedenergistics2.Grinder.addRecipe(dust, ingot, 1);
    mods.thermalexpansion.Pulverizer.addRecipe(dust, ingot, energy);
    mods.immersiveengineering.Crusher.addRecipe(dust, ingot, energy);
    recipes.addShapeless("block_" ~ getItemRecipeNameWithUnderline(ingot), ingot * 9, [block]);
    recipes.addShaped(getItemRecipeNameWithUnderline(block), block, [
        [ingot, ingot, ingot],
        [ingot, ingot, ingot],
        [ingot, ingot, ingot]
    ]);
}