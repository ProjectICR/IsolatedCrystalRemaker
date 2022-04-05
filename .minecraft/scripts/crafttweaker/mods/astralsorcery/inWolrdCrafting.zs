#priority 5
#loader crafttweaker
import mods.inworldcrafting.FluidToItem;
import mods.icrutils.support.StarLightRecipe;

FluidToItem.transform(<astralsorcery:blockmarble>, <fluid:astralsorcery.liquidstarlight>, [<minecraft:stone>], false);

StarLightRecipe.addRecipe("blockAltar", <astralsorcery:blockaltar>, <avaritia:compressed_crafting_table>, 5);
StarLightRecipe.addRecipe("crystal", <astralsorcery:itemrockcrystalsimple>.withTag({astralsorcery : {crystalProperties : {collectiveCapability : 50, size : 200, fract : 0, purity : 50, sizeOverride : -1}}}), <minecraft:diamond>, 120);

StarLightRecipe.addRecipe("crystalOre", <astralsorcery:blockcustomore:1>, <minecraft:iron_ore>, 20, [<minecraft:redstone>], [<minecraft:gunpowder>]);