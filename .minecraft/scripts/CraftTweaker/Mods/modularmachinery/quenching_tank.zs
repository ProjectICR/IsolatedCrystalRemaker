import mods.modularmachinery.RecipeBuilder;

RecipeBuilder.newBuilder("quenching_tank", "quenched_wrought_iron_plate", 100)
.addItemInput(<contenttweaker:wroughtiron_hot_plate>)
.addItemOutput(<contenttweaker:wroughtiron_quenched_plate>)
.build();