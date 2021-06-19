#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.requious.Assembly;
import mods.requious.SlotVisual;
import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;

var allFace as ComponentFace = ComponentFace.all();
var crystal as IItemStack = <thaumcraft:crystal_essence>;
static em as Assembly = <assembly:essences_materializer>;

em.setDurationSlot(6, 2).setGroup("time").setVisual(SlotVisual.arrowRight());
em.setItemSlot(0, 1, allFace, 64).setGroup("input").setAccess(true, false);
em.setItemSlot(0, 3, allFace, 64).setGroup("input").setAccess(true, false);
em.setItemSlot(2, 0, allFace, 64).setGroup("input").setAccess(true, false);
em.setItemSlot(2, 4, allFace, 64).setGroup("input").setAccess(true, false);
em.setItemSlot(4, 1, allFace, 64).setGroup("input").setAccess(true, false);
em.setItemSlot(4, 3, allFace, 64).setGroup("input").setAccess(true, false);
em.setFluidSlot(8, 4, allFace, 1000).setGroup("output").allowBucket(false, true).pushFluid(100);
em.setItemSlot(8, 2, allFace, 64).setGroup("output").setHandAccess(false, true).setAccess(false, true).pushItem(1);

em.setJEIItemSlot(0, 1, "input");
em.setJEIItemSlot(0, 3, "input");
em.setJEIItemSlot(2, 0, "input");
em.setJEIItemSlot(2, 4, "input");
em.setJEIItemSlot(4, 1, "input");
em.setJEIItemSlot(4, 3, "input");
em.setJEIItemSlot(8, 2, "output");
em.setJEIFluidSlot(8, 4, "output");
em.setJEIDurationSlot(6, 2, "time", SlotVisual.arrowRight());

function addEMRecipe(output as IItemStack, input as IIngredient[], seconds as int) {
    var recipe as AssemblyRecipe = AssemblyRecipe.create(function(container) {
        container.addItemOutput("output", output);
    });

    for i, item in input {
        recipe.requireItem("input", item);

        if(i == input.length - 1) {
            recipe.requireDuration("time", (seconds * 20));
        }
    }

    em.addRecipe(recipe);
    em.addJEIRecipe(recipe);
}

function addEMFluidRecipe(output as ILiquidStack, input as IIngredient[], seconds as int) {
    var recipe as AssemblyRecipe = AssemblyRecipe.create(function(container) {
        container.addFluidOutput("output", output * 1000);
    });

    for i, liquid in input {
        recipe.requireItem("input", liquid);

        if(i == input.length - 1) {
            recipe.requireDuration("time", (seconds * 20));
        }
    }

    em.addRecipe(recipe);
    em.addJEIRecipe(recipe);
}

var itemList as IIngredient[][IItemStack] = {
    <minecraft:cobblestone> : [crystal.withTag({Aspects: [{amount: 1, key: "terra"}]}) * 2],
    <minecraft:sapling> : [crystal.withTag({Aspects: [{amount: 1, key: "aer"}]}), crystal.withTag({Aspects: [{amount: 1, key: "terra"}]})],
    <minecraft:clay> : [crystal.withTag({Aspects: [{amount: 1, key: "terra"}]}), crystal.withTag({Aspects: [{amount: 1, key: "aqua"}]})]
};

var fluidList as IIngredient[][ILiquidStack] = {
    <liquid:water>: [crystal.withTag({Aspects: [{amount: 1, key: "aqua"}]}) * 8],
    <liquid:lava> : [crystal.withTag({Aspects: [{amount: 1, key: "ignis"}]}) * 8]
};

for output, input in itemList {
    addEMRecipe(output, input, 5);
}

for output, input in fluidList {
    addEMFluidRecipe(output, input, 5);
}