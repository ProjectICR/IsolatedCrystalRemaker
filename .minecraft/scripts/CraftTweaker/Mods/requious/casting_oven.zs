#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.requious.SlotVisual;
import mods.requious.AssemblyRecipe;

import scripts.CraftTweaker.Mods.static_variable.allFace;
import scripts.CraftTweaker.Mods.static_variable.casting;

casting.setDurationSlot(5, 2).setGroup("time").setVisual(SlotVisual.arrowRight());
casting.setItemSlot(3, 2, allFace, 64).setGroup("input").setAccess(true, false);
casting.setItemSlot(4, 2, allFace, 64).setGroup("input").setAccess(true, false);
casting.setEnergySlot(1, 2, allFace, 12000).setGroup("energy").setAccess(true, true);
casting.setItemSlot(6, 2, allFace, 64).setGroup("output").setHandAccess(false, true).setAccess(false, true).pushItem(1);

casting.setJEIItemSlot(3, 2, "input");
casting.setJEIItemSlot(4, 2, "input");
casting.setJEIItemSlot(6, 2, "output");
casting.setJEIEnergySlot(1, 2, "energy");
casting.setJEIDurationSlot(5, 2, "time", SlotVisual.arrowRight());

function addCORecipe(output as IItemStack, input as IIngredient[], energy as int, seconds as int) {
    var recipe as AssemblyRecipe = AssemblyRecipe.create(function(container) {

        container.addItemOutput("output", output);
    });

    for i, item in input {

        recipe.requireItem("input", item);
        if(i == input.length - 1) {

            recipe.requireEnergy("energy", energy).requireDuration("time", (seconds * 20));
        }
    }

    casting.addRecipe(recipe);
    casting.addJEIRecipe(recipe);
}

addCORecipe(<contenttweaker:pig_iron_billet>, [<ic2:crushed:2> * 4, <minecraft:coal:1> * 6], 1200, 10);