#loader crafttweaker
import mods.modularmachinery.RecipeBuilder;


var machineName as string = "carbon_monoxide_generator";

RecipeBuilder.newBuilder("co_h2", machineName, 600)
.addItemInput(<ore:coal>, 4)
.addFluidInput(<fluid:water> * 400)
.addGasOutput("hydrogen", 200)
.addGasOutput("carbon_monoxide_gas", 1000)
.build();