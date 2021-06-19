#loader crafttweaker
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

import scripts.contenttweaker.recipes.hotRecipe.materials;
import scripts.grassUtils.StringHelper.getItemNameWithUnderline;

var machineName as string = "forging_hammer_machine";


RecipeBuilder.newBuilder("hot_wrought_iron", machineName, 400)
.addItemInput(<contenttweaker:pig_iron_billet>)
.addItemOutput(<contenttweaker:wroughtiron_hot_ingot> * 4)
.build();


for material in materials {
    var hIngot as IOreDictEntry = oreDict.get("hotIngot" ~ material);
    var hPlate as IOreDictEntry = oreDict.get("hotPlate" ~ material);

    RecipeBuilder.newBuilder(getItemNameWithUnderline(hPlate.firstItem), machineName, 400)
    .addItemInput(hIngot)
    .addItemOutput(hPlate.firstItem)
    .build();
}