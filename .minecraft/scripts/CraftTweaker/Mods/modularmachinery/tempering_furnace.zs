#loader crafttweaker
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

import scripts.contenttweaker.recipes.recipe.ingotToRotor;


var machineName as string = "tempering_furnace";


for oreName in ingotToRotor {
    var oreNameNew as string = oreName.toLowerCase();
    var hotPlate as IOreDictEntry = oreDict.get("hotPlate" ~ oreName);

    RecipeBuilder.newBuilder("type" ~ oreNameNew, machineName, 400)
    .addItemInput(hotPlate)
    .addItemOutput(<contenttweaker:middle_item>.withTag({type : oreNameNew}))
    .build();
}