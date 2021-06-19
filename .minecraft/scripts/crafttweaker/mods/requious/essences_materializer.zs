#loader crafttweaker
import crafttweaker.item.IItemStack;

import mods.requious.Assembly;
import mods.requious.SlotVisual;
import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;


var allFace as ComponentFace = ComponentFace.all();
var crystal as IItemStack = <thaumcraft:crystal_essence>;
static em as Assembly = <assembly:essences_materializer>;


em.setDurationSlot(6, 2).setGroup("time").setVisual(SlotVisual.arrowRight());
em.setItemSlot(0, 1, allFace, 64).setGroup("input0").setAccess(true, false);
em.setItemSlot(0, 3, allFace, 64).setGroup("input1").setAccess(true, false);
em.setItemSlot(2, 0, allFace, 64).setGroup("input2").setAccess(true, false);
em.setItemSlot(2, 4, allFace, 64).setGroup("input3").setAccess(true, false);
em.setItemSlot(4, 1, allFace, 64).setGroup("input4").setAccess(true, false);
em.setItemSlot(4, 3, allFace, 64).setGroup("input5").setAccess(true, false);
em.setFluidSlot(8, 4, allFace, 1000).setGroup("output").allowBucket(false, true).pushFluid(100);
em.setItemSlot(8, 2, allFace, 64).setGroup("output").setHandAccess(false, true).setAccess(false, true).pushItem(1);

em.setJEIItemSlot(0, 1, "input0");
em.setJEIItemSlot(0, 3, "input1");
em.setJEIItemSlot(2, 0, "input2");
em.setJEIItemSlot(2, 4, "input3");
em.setJEIItemSlot(4, 1, "input4");
em.setJEIItemSlot(4, 3, "input5");
em.setJEIItemSlot(8, 2, "output");
em.setJEIFluidSlot(8, 4, "output");
em.setJEIDurationSlot(6, 2, "time", SlotVisual.arrowRight());


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

var aspling as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addItemOutput("output", <minecraft:sapling>);
}).requireItem("input2", getCrystal("aer"))
.requireItem("input3", getCrystal("terra"))
.requireDuration("time", 100);

var clay as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addItemOutput("output", <minecraft:clay>);
}).requireItem("input1", getCrystal("aqua"))
.requireItem("input4", getCrystal("terra"))
.requireDuration("time", 100);

var water as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addFluidOutput("output", <liquid:water> * 1000);
}).requireItem("input1", getCrystal("aqua") * 8)
.requireDuration("time", 100);

var lava as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addFluidOutput("output", <liquid:lava> * 1000);
}).requireItem("input1", getCrystal("ignis") * 8)
.requireDuration("time", 100);


var recipes as AssemblyRecipe[] = [
    stone, 
    aspling, 
    clay,
    water, 
    lava
];


addRecipe(recipes);