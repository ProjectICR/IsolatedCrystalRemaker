#loader crafttweaker
import crafttweaker.oredict.IOreDictEntry;

import mods.modularmachinery.RecipeBuilder;

import scripts.CraftTweaker.Mods.cotRecipe.ingotToPlate;
import scripts.grassUtils.StringHelper.getItemNameWithUnderline;

var machineName as string = "forging_hammer_machine";


RecipeBuilder.newBuilder("hot_wrought_iron", machineName, 400)
.addItemInput(<contenttweaker:pig_iron_billet>)
.addItemOutput(<contenttweaker:wroughtiron_hot_ingot> * 4)
.build();


for oreName in ingotToPlate {
    var ingot as IOreDictEntry = oreDict.get("hotIngot" ~ oreName);
    var plate as IOreDictEntry = oreDict.get("hotPlate" ~ oreName);

    RecipeBuilder.newBuilder(getItemNameWithUnderline(plate.firstItem), machineName, 400)
    .addItemInput(ingot)
    .addItemOutput(plate.firstItem)
    .build();
}