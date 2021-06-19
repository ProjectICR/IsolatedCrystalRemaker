#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInventory;

import mods.tconstruct.Drying;

import scripts.grassUtils.RecipeUtils;
import scripts.grassUtils.StringHelper.getItemNameWithUnderline;

var crystal as IItemStack = <thaumcraft:crystal_essence>;

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



recipes.addShaped(getItemNameWithUnderline(<contenttweaker:ambient_block>), <contenttweaker:ambient_block>, [
    [<ore:livingrock>, null, <ore:livingrock>],
    [<ore:ingotManasteel>, <botania:manatablet>.withTag({mana: 1000}, false).marked("manatablet").reuse(), <ore:ingotManasteel>],
    [<ore:livingwood>, null, <ore:livingwood>]
], function(out, ins, cInfo) {
    return !isNull(ins.manatablet.tag.mana) && ins.manatablet.tag.mana >= 1000 ? out : null;
}, function(out, cinfo, player) {
    if(!player.world.remote) {
        var inventory as ICraftingInventory = cinfo.inventory;
        var item as IItemStack = inventory.getStack(4);
        
        inventory.setStack(4, item.withTag({mana : item.tag.mana.asInt() - 1000}));
    }
});

Drying.addRecipe(<mekanism:ingot:4>, <ore:hotIngotSteel>, 1800);
Drying.addRecipe(<thermalfoundation:material:352>, <ore:hotPlateSteel>, 1800);