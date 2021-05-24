#loader crafttweaker
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import scripts.grassUtils.RecipeUtils;
import scripts.CraftTweaker.Mods.requious.essences_materializer.crystal;


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