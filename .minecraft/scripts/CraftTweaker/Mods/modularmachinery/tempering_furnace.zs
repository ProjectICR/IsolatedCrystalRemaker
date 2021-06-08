#loader crafttweaker
import mods.modularmachinery.RecipeBuilder;


var machineName as string = "tempering_furnace";

RecipeBuilder.newBuilder("type_casted", machineName, 100)
.addItemInput(<ore:hotPlateCastediron>)
.addItemOutput(<contenttweaker:middle_item>.withTag({type : "casted_iron"}))
.build();

RecipeBuilder.newBuilder("type_wrought", machineName, 100)
.addItemInput(<ore:hotPlateWroughtiron>)
.addItemOutput(<contenttweaker:middle_item>.withTag({type : "wrought_iron"}))
.build();