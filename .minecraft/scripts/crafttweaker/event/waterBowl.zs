#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.block.IBlock;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.entity.IEntityEquipmentSlot;

import crafttweaker.event.PlayerRightClickItemEvent;


events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {
    var world as IWorld = event.world;
    var item as IItemStack = event.item;
    var player as IPlayer = event.player;
    var pos as IBlockPos = player.getRayTrace(6.0, 1.0f, true).blockPos;

    if(!world.remote && item.definition.id == "minecraft:bowl") {
        var block as IBlock = world.getBlockState(pos).block;

        if(!isNull(block.fluid) && block.fluid.name == "water") {
            player.setItemToSlot(IEntityEquipmentSlot.mainHand(), <contenttweaker:water_bowl>);
        }
    }
});