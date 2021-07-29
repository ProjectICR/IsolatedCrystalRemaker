#loader crafttweaker
import crafttweaker.data.IData;
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

import scripts.contenttweaker.recipes.hotRecipe.materials;


var machineName as string = "tempering_furnace";

var isQuenching as IData = {quenching : true as bool};
var isTempering as IData = {tempering : true as bool};

for material in materials {
    var materialNew as string = material.toLowerCase();
    var qPlate as IOreDictEntry = oreDict.get("quenchedPlate" ~ material);

    RecipeBuilder.newBuilder("type_" ~ materialNew ~ "_plate", machineName, 400)
    .addItemInput(qPlate)
    .addItemOutput(<contenttweaker:intermediate_product>.withTag({type : (materialNew ~ "_plate") as string} + isTempering))
    .build();
}

RecipeBuilder.newBuilder("quenching_tempering_steel", machineName, 400)
.addItemInput(<contenttweaker:intermediate_product>.withTag({type : "steel_ingot" as string} + isQuenching))
.addItemOutput(<contenttweaker:intermediate_product>.withTag({type : "steel_ingot" as string} + isQuenching + isTempering))
.build();