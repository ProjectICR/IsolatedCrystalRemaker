#loader crafttweaker
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import scripts.grassUtils.RecipeUtils;

var ShapedRecipes as IIngredient[][][IItemStack] = {
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

for output, inputBox in ShapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}