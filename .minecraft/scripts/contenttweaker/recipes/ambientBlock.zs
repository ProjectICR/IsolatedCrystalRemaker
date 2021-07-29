#priority 5
#loader crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.recipes.ICraftingInventory;

import scripts.grassUtils.StringHelper.getItemNameWithUnderline;


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