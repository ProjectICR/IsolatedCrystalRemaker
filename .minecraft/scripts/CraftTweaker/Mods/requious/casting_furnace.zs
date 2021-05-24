#priority 98
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.requious.Assembly;
import mods.requious.SlotVisual;
import mods.requious.ComponentFace;
import mods.requious.AssemblyRecipe;

import scripts.CraftTweaker.Mods.requious.casting_oven.allFace;

static castFurnce as Assembly = <assembly:casting_furnace>;

castFurnce.setDurationSlot(4, 2).setGroup("time").setVisual(SlotVisual.arrowUp());
castFurnce.setItemSlot(4, 3, allFace, 64).setGroup("input").setAccess(true, false);
castFurnce.setItemSlot(4, 1, allFace, 64).setGroup("output").setHandAccess(false, true).setAccess(false, true).pushItem(1);

castFurnce.setJEIItemSlot(4, 3, "input");
castFurnce.setJEIItemSlot(4, 1, "output");
castFurnce.setJEIDurationSlot(4, 2, "time", SlotVisual.arrowUp());

function addCFRecipe(output as IItemStack, input as IIngredient, seconds as int) {
    var recipe as AssemblyRecipe = AssemblyRecipe.create(function(container) {

        container.addItemOutput("output", output);
    }).requireItem("input", input)
    .requireDuration("time", (seconds * 20));

    castFurnce.addRecipe(recipe);
    castFurnce.addJEIRecipe(recipe);
}

addCFRecipe(<contenttweaker:hotcastediron_hot_ingot> * 8, <contenttweaker:pig_iron_billet>, 5);