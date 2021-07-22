#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.astralsorcery.Altar;
import mods.inworldcrafting.FluidToItem;

FluidToItem.transform(<astralsorcery:blockmarble>, <fluid:astralsorcery.liquidstarlight>, [<minecraft:stone>], false);

Altar.addAttunementAltarRecipe("custom:altar/starmetal", <astralsorcery:itemcraftingcomponent:1> * 2, 500, 60, [
    null, null ,null,
    null, <astralsorcery:blockcustomore:1>, null,
    null, null, null,
    <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>
]);
