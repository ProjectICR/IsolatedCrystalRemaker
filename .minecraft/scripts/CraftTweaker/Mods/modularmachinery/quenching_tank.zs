#loader crafttweaker
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

import scripts.CraftTweaker.Mods.cotRecipe.ingotToPlate;
import scripts.grassUtils.StringHelper.getItemNameWithUnderline;

var machineName as string = "quenching_tank";


RecipeBuilder.newBuilder("casted_iron_plate", machineName, 200)
.addItemInput(<contenttweaker:middle_item>.withTag({type : "casted_iron"}))
.addItemOutput(<contenttweaker:castediron_plate>)
.build();

RecipeBuilder.newBuilder("wrought_iron_plate", machineName, 200)
.addItemInput(<contenttweaker:middle_item>.withTag({type : "wrought_iron"}))
.addItemOutput(<contenttweaker:wroughtiron_plate>)
.build();


for oreName in ingotToPlate {
    var ingot as IOreDictEntry = oreDict.get("hotIngot" ~ oreName);
    var qPlate as IOreDictEntry = oreDict.get("quenchedPlate" ~ oreName);

    RecipeBuilder.newBuilder(getItemNameWithUnderline(qPlate.firstItem), machineName, 600)
    .addItemInput(ingot)
    .addItemOutput(qPlate.firstItem)
    .build();
}