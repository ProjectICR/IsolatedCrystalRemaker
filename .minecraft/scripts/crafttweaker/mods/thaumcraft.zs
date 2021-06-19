#loader crafttweaker
import mods.thaumcraft.Crucible;

import scripts.grassUtils.StringHelper.getItemNameWithUnderline;


Crucible.registerRecipe(getItemNameWithUnderline(<integrateddynamics:menril_sapling>), "", <integrateddynamics:menril_sapling>, <minecraft:sapling:2>, [
    <aspect:instrumentum> * 5, <aspect:terra> * 5, <aspect:praecantatio> * 5
]);