#loader crafttweaker
import mods.modularmachinery.RecipeBuilder;


RecipeBuilder.newBuilder("pin_iron_billet", "casting_oven", 400)
.addItemInput(<ic2:crushed:2> * 4)
.addItemInput(<ore:coal>, 6)
.addItemOutput(<contenttweaker:pig_iron_billet>)
.build();