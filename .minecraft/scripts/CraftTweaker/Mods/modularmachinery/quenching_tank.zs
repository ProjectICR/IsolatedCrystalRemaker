#loader crafttweaker
import mods.modularmachinery.RecipeBuilder;


var machineName as string = "quenching_tank";

RecipeBuilder.newBuilder("quenched_casted_iron_plate", machineName, 100)
.addFluidInput(<fluid:water> * 1000)
.addItemInput(<ore:hotPlateCastediron>)
.addItemOutput(<contenttweaker:castediron_quenched_plate>)
.build();

RecipeBuilder.newBuilder("quenched_wrought_iron_plate", machineName, 100)
.addFluidInput(<fluid:water> * 1000)
.addItemInput(<ore:hotPlateWroughtiron>)
.addItemOutput(<contenttweaker:wroughtiron_quenched_plate>)
.build();

RecipeBuilder.newBuilder("casted_iron_plate", machineName, 200)
.addItemInput(<contenttweaker:middle_item>.withTag({type : "casted_iron"}))
.addItemOutput(<contenttweaker:castediron_plate>)
.build();

RecipeBuilder.newBuilder("wrought_iron_plate", machineName, 200)
.addItemInput(<contenttweaker:middle_item>.withTag({type : "wrought_iron"}))
.addItemOutput(<contenttweaker:wroughtiron_plate>)
.build();