#loader crafttweaker
import crafttweaker.data.IData;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

import scripts.contenttweaker.recipes.hotRecipe.materials;
import scripts.grassUtils.StringHelper.getItemNameWithUnderline;


var machineName as string = "quenching_tank";

var isQuenching as IData = {quenching : true as bool};
var isTempering as IData = {tempering : true as bool};

for material in materials {
    var materialNew as string = material.toLowerCase();
    var plate as IOreDictEntry = oreDict.get("plate" ~ material);
    var hPlate as IOreDictEntry = oreDict.get("hotPlate" ~ material);
    var qPlate as IOreDictEntry = oreDict.get("quenchedPlate" ~ material);

    RecipeBuilder.newBuilder(getItemNameWithUnderline(qPlate.firstItem), machineName, 600)
    .addItemInput(hPlate)
    .addItemOutput(qPlate.firstItem)
    .build();

    RecipeBuilder.newBuilder(getItemNameWithUnderline(plate.firstItem), machineName, 600)
    .addItemInput(<contenttweaker:intermediate_product>.withTag({type : (materialNew ~ "_plate") as string} + isTempering))
    .addItemOutput(plate.firstItem)
    .build();
}

RecipeBuilder.newBuilder("quenching_steel", machineName, 600)
.addItemInput(<ore:hotIngotSteel>)
.addItemOutput(<contenttweaker:intermediate_product>.withTag({type : "steel_ingot" as string} + isQuenching))
.build();

RecipeBuilder.newBuilder("steel_ingot", machineName, 600)
.addItemInput(<contenttweaker:intermediate_product>.withTag({type : "steel_ingot" as string} + isQuenching + isTempering))
.addItemOutput(<mekanism:ingot:4>)
.build();