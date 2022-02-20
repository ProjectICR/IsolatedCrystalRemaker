#priority 100
#loader contenttweaker

import mods.zenutils.cotx.Block;
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.cotx.TileEntityInGame;

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;

import scripts.contenttweaker.blocks.tileEntity.ambientTile.teSL;

var ambient as Block = VanillaFactory.createExpandBlock("ambient_block", <blockmaterial:leaves>);
ambient.tileEntity = teSL;
ambient.onBlockActivated = function(world, pos, state, player, hand, facing, blockHit) {
    if(!world.remote && player.hasItemInSlot(hand.asEntityEquipmentSlot())) {
        var heldItem as IItemStack = player.getHeldItem(hand);
        var mana as IData = heldItem.tag.mana;
        
        if(heldItem.definition.id == "botania:manatablet" && !isNull(mana)) {
            var manaCapacity as int = mana.asInt();
            var tile as TileEntityInGame = world.getCustomTileEntity(pos);

            if(manaCapacity >= 10000 && isNull(tile.data.hasMana)) {
                if(isNull(heldItem.tag.creative) || !player.creative) {
                    heldItem.mutable().updateTag({mana : manaCapacity - 10000 as int});
                }

                tile.updateCustomData({hasMana : true as bool});
                return true;
            }
        }
    }
    return false;
};
ambient.register();
