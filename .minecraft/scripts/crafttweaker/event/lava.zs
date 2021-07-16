#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.block.IBlock;
import crafttweaker.world.IWorld;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityEquipmentSlot;

import crafttweaker.event.PlayerInteractBlockEvent;

import scripts.grassUtils.GrassUtils;


events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    var world as IWorld = event.world;
    var player as IPlayer = event.player;
    var rightBlock as IBlock = event.block;
    var useItem as IItemStack = event.item;
    var playerData as IData = player.data.PlayerPersisted;
    var offHand as IEntityEquipmentSlot = IEntityEquipmentSlot.offhand();

    if(!world.remote && player.hasItemInSlot(offHand) && !isNull(useItem) && useItem.definition.id == "minecraft:iron_ingot") {
        var offHandItem as IItemStack = player.getItemInSlot(offHand);
        
        if(offHandItem.definition.id == "minecraft:flint") {
            if(rightBlock.definition.id == "botania:blazeblock") {
                if(isNull(playerData.rightBlazeblock)) {
                    world.setBlockState(<blockstate:lava>, event.position);
                } else {
                    player.sendChat(GrassUtils.i18n("icr.text.info.lava"));
                }

                player.update(({PlayerPersisted : {rightBlazeblock: true as bool}}));
                offHandItem.mutable().shrink(1);
            }

            if(rightBlock.definition.id == "extrautils2:compressedcobblestone") {
                if(!isNull(playerData.rightBlazeblock) && playerData.rightBlazeblock.asBool()) {

                    world.setBlockState(<blockstate:lava>, event.position);
                    offHandItem.mutable().shrink(1);
                }
            }
        }
    }
});