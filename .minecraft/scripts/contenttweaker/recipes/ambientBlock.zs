#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.recipes.ICraftingInventory;

import scripts.grassUtils.StringHelper.getItemNameWithUnderline;


recipes.addShaped(getItemNameWithUnderline(<contenttweaker:ambient_block>), <contenttweaker:ambient_block>, [
    [<ore:livingrock>, null, <ore:livingrock>],
    [<ore:ingotManasteel>, <botania:manatablet>.marked("manatablet").reuse(), <ore:ingotManasteel>],
    [<ore:livingwood>, null, <ore:livingwood>]
], function(out, ins, cInfo) {
    return ins.manatablet.hasTag && !isNull(ins.manatablet.tag.mana) && ins.manatablet.tag.mana >= 1000 ? out : null;
}, function(out, cinfo, player) {
    if(!player.world.remote) {
        var item as IItemStack = cinfo.inventory.getStack(4);
        item.mutable().updateTag({mana : item.tag.mana.asInt() - 1000});
    }
});