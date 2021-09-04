#priority 30
#loader crafttweaker reloadableevents
import crafttweaker.item.IItemStack;

import mods.requious.Assembly;
import mods.requious.AssemblyRecipe;


function addRecipe(machine as Assembly, recipes as AssemblyRecipe[], jei as bool) {
    for recipe in recipes {
        machine.addRecipe(recipe);
        if(jei) {
            machine.addJEIRecipe(recipe);
        }
    }
}


function getCrystal(id as string) as IItemStack {
    return <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: id}]});
}