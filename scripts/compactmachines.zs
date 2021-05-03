#loader crafttweaker
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import scripts.functionLib;

var shapedRecipes as IIngredient[][][IItemStack] = {
    <compactmachines3:fieldprojector> : [
        [null, <astralsorcery:blockstarlightinfuser>, null],
        [null, <ore:enderpearl>, null],
        [<ore:manaDiamond>, <compactmachines3:psd>.reuse(), <ore:manaDiamond>]
    ],

    <compactmachines3:psd> : [
        [null, <botania:managlass>, null],
        [<ore:manaPearl>, <minecraft:book>, <ore:manaDiamond>],
        [null, <astralsorcery:itemrockcrystalsimple>, null]
    ]
};

functionLib.addShapedRecipe(shapedRecipes);