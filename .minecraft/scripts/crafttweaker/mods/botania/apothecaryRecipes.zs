#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.botania.Apothecary;


function apothecaryRecipeTweak(output as IItemStack, input as IIngredient[]) {
    Apothecary.removeRecipe(output);
    Apothecary.addRecipe(output, input);
}


apothecaryRecipeTweak(<botania:specialflower>.withTag({type: "endoflame"}), 
    [<ore:petalRed>, <ore:petalLightGray>, <ore:powderMana>, <ore:petalLightGray>, <ore:petalLightGray>]
);

apothecaryRecipeTweak(<botania:specialflower>.withTag({type: "orechid"}),
    [<botania:petal:4>, <botania:petal:4>, <botania:petal:7>, <botania:petal:7>, <botania:petal:14>, <botania:petal:14>, <botania:petal:13>, <botania:petal:13>]
);