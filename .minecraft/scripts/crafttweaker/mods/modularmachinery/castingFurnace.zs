#loader crafttweaker
import mods.modularmachinery.RecipeBuilder;


RecipeBuilder.newBuilder("hot_casted_iron", "casting_furnace", 400)
.addItemInput(<contenttweaker:pig_iron_billet> * 2)
.addItemInput(<ore:coal>, 6)
.addItemOutput(<contenttweaker:castediron_hot_ingot> * 8)
.build();