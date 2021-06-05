#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;

import scripts.CraftTweaker.Mods.static_variable.allFace;
import scripts.CraftTweaker.Mods.static_variable.fhm;

fhm.setDurationSlot(4, 2).setGroup("time").setVisual(SlotVisual.arrowDown());
fhm.setItemSlot(4, 1, allFace, 64).setGroup("input").setAccess(true, false);
fhm.setEnergySlot(0, 4, allFace, 12800).setGroup("energy").setAccess(true, true);
fhm.setItemSlot(4, 3, allFace, 64).setGroup("output").setAccess(false, true).setHandAccess(false, true).pushItem(1);

fhm.setJEIItemSlot(4, 1, "input");
fhm.setJEIItemSlot(4, 3, "output");
fhm.setJEIDurationSlot(4, 2, "time", SlotVisual.arrowDown());

function addFHMRecipe(output as IItemStack, input as IIngredient, energy as int, seconds as int) {
    var recipe as AssemblyRecipe = AssemblyRecipe.create(function(container){
        container.addItemOutput("output", output);
    }).requireItem("input", input)
    .requireEnergy("energy", energy)
    .requireDuration("time", (seconds * 20));

    fhm.addRecipe(recipe);
    fhm.addJEIRecipe(recipe);
}

addFHMRecipe(<contenttweaker:wroughtiron_hot_ingot> * 5, <contenttweaker:pig_iron_billet>, 5000, 5);
addFHMRecipe(<contenttweaker:wroughtiron_hot_plate>, <ore:hotIngotWroughtiron>, 6000, 6);