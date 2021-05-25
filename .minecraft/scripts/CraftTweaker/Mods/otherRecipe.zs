#loader crafttweaker
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import scripts.grassUtils.RecipeUtils;
<<<<<<< HEAD
import scripts.CraftTweaker.Mods.static_variable.crystal;
=======
import scripts.CraftTweaker.Mods.requious.essences_materializer.crystal;
>>>>>>> 82b6b63f7794a90c768d1abf2ae4de805753f4b6


var shapedRecipes as IIngredient[][][IItemStack] = {
    <requious:essences_materializer> : [
        [crystal.withTag({Aspects: [{amount: 1, key: "aer"}]}), crystal.withTag({Aspects: [{amount: 1, key: "ignis"}]}), crystal.withTag({Aspects: [{amount: 1, key: "aer"}]})],
        [crystal.withTag({Aspects: [{amount: 1, key: "ignis"}]}), null, crystal.withTag({Aspects: [{amount: 1, key: "ignis"}]})],
        [crystal.withTag({Aspects: [{amount: 1, key: "terra"}]}), crystal.withTag({Aspects: [{amount: 1, key: "ignis"}]}), crystal.withTag({Aspects: [{amount: 1, key: "terra"}]})]
    ]
};


for output, inputBox in shapedRecipes {
    RecipeUtils.recipeTweak(true, output, inputBox);
}