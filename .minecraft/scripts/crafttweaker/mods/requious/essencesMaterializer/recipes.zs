#priority 5
#loader crafttweaker
import mods.requious.AssemblyRecipe;

import scripts.grassUtils.RecipeUtils;
import scripts.crafttweaker.util.RequiousUtils.getCrystal;
import scripts.crafttweaker.util.RequiousUtils.addRecipe;
import scripts.crafttweaker.mods.requious.essencesMaterializer.essencesMaterializer.em;


var stone as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addItemOutput("output", <minecraft:cobblestone>);
}).requireItem("input0", getCrystal("terra") * 2)
.requireDuration("time", 100);

var sapling as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addItemOutput("output", <minecraft:sapling>);
}).requireItem("input2", getCrystal("aer"))
.requireItem("input1", getCrystal("terra"))
.requireDuration("time", 100);

var clay as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addItemOutput("output", <minecraft:clay>);
}).requireItem("input0", getCrystal("aqua"))
.requireItem("input3", getCrystal("terra"))
.requireDuration("time", 100);

var mutton as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addItemOutput("output", <minecraft:mutton> * 2);
}).requireItem("input1", getCrystal("victus"))
.requireItem("input2", getCrystal("terra"))
.requireDuration("time", 200);

var water as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addFluidOutput("output", <liquid:water> * 1000);
}).requireItem("input1", getCrystal("aqua") * 8)
.requireDuration("time", 100);

var lava as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addFluidOutput("output", <liquid:lava> * 1000);
}).requireItem("input2", getCrystal("ignis") * 8)
.requireDuration("time", 100);

RecipeUtils.recipeTweak(true, <requious:essences_materializer>, [
    [getCrystal("aer"), getCrystal("ignis"), getCrystal("aer")],
    [getCrystal("ignis"), null, getCrystal("ignis")],
    [getCrystal("terra"), getCrystal("ignis"), getCrystal("terra")]
]);

addRecipe(em, [stone, sapling, clay, mutton, water, lava], true);
