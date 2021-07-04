#loader crafttweaker
import crafttweaker.item.IItemStack;

import mods.requious.AssemblyRecipe;

import scripts.crafttweaker.mods.requious.essences_materializer.em;


function addRecipe(recipes as AssemblyRecipe[]) {
    for recipe in recipes {
         em.addRecipe(recipe);
        em.addJEIRecipe(recipe);
    }
}


function getCrystal(id as string) as IItemStack {
    return <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: id}]});
}


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

var water as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addFluidOutput("output", <liquid:water> * 1000);
}).requireItem("input1", getCrystal("aqua") * 8)
.requireDuration("time", 100);

var lava as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addFluidOutput("output", <liquid:lava> * 1000);
}).requireItem("input2", getCrystal("ignis") * 8)
.requireDuration("time", 100);

var recipes as AssemblyRecipe[] = [
    stone, 
    sapling, 
    clay,
    water, 
    lava
];


addRecipe(recipes);