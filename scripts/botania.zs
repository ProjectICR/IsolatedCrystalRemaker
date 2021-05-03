#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import scripts.functionLib;

function apothecaryRecipeTweak(output as IItemStack, input as IIngredient[]) {
    mods.botania.Apothecary.removeRecipe(output);
    mods.botania.Apothecary.addRecipe(output, input);
}

var livingrock as IItemStack = <botania:livingrock>;

var ShapedRecipes as IIngredient[][][IItemStack] = {
    <botania:runealtar> : [
        [null, <minecraft:blaze_rod>, null],
        [livingrock, livingrock, livingrock],
        [livingrock, <botania:manaresource:1>|<botania:manaresource:2>, livingrock]
    ],

    <botania:corporeaindex> : [
        [<botania:manaresource:15>, <contenttweaker:integrated_circuit_engineer>, <botania:manaresource:15>],
        [<contenttweaker:block_titanium_sky>, <botania:corporeaspark>, <contenttweaker:block_titanium_sky>],
        [<botania:manaresource:9>, <contenttweaker:block_titanium_sky>, <botania:manaresource:9>]
    ],

    <botania:alchemycatalyst> : [
        [livingrock, <ore:ingotGold>, livingrock],
        [<minecraft:brewing_stand>, <extrautils2:compressedsand:1>, <minecraft:brewing_stand>],
        [livingrock, <ore:ingotGold>, livingrock]
    ],

    <botania:rfgenerator> : [
        [livingrock, <enderio:block_alloy:3>, livingrock],
        [<botania:storage>, <immersiveengineering:metal_decoration0:6>, <botania:storage>],
        [livingrock, <enderio:block_alloy:3>, livingrock]
    ]
};

var ShapelessRecipes as IIngredient[][IItemStack] = {
    <botania:manaresource:12> : [
        <botania:manaresource:16>, <botania:manaresource:8>, <ore:blockSignalum>, <ore:ingotEnderium>, <ore:ingotEnderium>, <botania:felpumpkin>
    ],

    <botania:corporeaspark> : [
        <botania:spark>, <botania:manaresource:8>, <botania:manaresource:15>, <botania:manaresource:12>, <contenttweaker:processor_transport>
    ]
};

functionLib.addShapedRecipe(ShapedRecipes);

functionLib.addShapelessRecipe(ShapelessRecipes);

mods.botania.ManaInfusion.addAlchemy(<minecraft:double_plant>, <botania:petal:4> * 4, 150);

apothecaryRecipeTweak(<botania:specialflower>.withTag({type: "endoflame"}), 
    [<ore:petalRed>, <ore:petalLightGray>, <ore:powderMana>, <ore:petalLightGray>, <ore:petalLightGray>]
);