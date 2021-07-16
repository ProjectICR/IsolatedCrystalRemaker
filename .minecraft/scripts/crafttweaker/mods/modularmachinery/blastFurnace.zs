#loader crafttweaker
import mods.modularmachinery.RecipeBuilder;

var machineName as string = "blast_furnace";

RecipeBuilder.newBuilder("fluid_steel", machineName, 400)
.addItemInput(<ore:hotIngotCastediron>, 8)
.addGasInput("carbon_monoxide_gas", 1000)
.addFluidOutput(<fluid:hot_steel> * 576)
.build();