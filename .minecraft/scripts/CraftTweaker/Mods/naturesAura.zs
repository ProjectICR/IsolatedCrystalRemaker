#loader crafttweaker
import mods.naturesaura.TreeRitual;
import mods.naturesaura.Altar;

import scripts.grassUtils.StringHelper.getItemNameWithUnderline;


TreeRitual.addRecipe(getItemNameWithUnderline(<ic2:sapling>), <minecraft:sapling>, <ic2:sapling>, 200, [
    <ore:slimeball>, <ore:slimeball>, <ore:slimeball>, <ore:slimeball>
]);

Altar.addRecipe(getItemNameWithUnderline(<tconstruct:slime_sapling>), <minecraft:sapling>, <tconstruct:slime_sapling>, null, 0, 64000);

Altar.addRecipe(getItemNameWithUnderline(<tconstruct:slime_dirt>), <minecraft:dirt>, <tconstruct:slime_dirt>, null, 0, 64000);