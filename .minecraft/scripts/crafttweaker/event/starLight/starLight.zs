#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.item.IItemStack;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;

import crafttweaker.event.ItemTossEvent;

import mods.ctutils.utils.Math;

static blockFluid as IBlockState = <blockstate:astralsorcery:fluidblockliquidstarlight>;


events.onItemToss(function(event as ItemTossEvent) {
    var player as IPlayer = event.player;

    if(!player.world.remote) {
        event.item.setNBT({playerName : player.name});
    }
});


function timer(nbt as IData, seconds as int) as bool {
    return !isNull(nbt.time) && nbt.time.asInt() != 0 && nbt.time.asInt() % (seconds * 20) == 0;
}

function getBlockPos(entity as IEntity) as IBlockPos {
    return Position3f.create(Math.floor(entity.x), Math.floor(entity.y), Math.floor(entity.z)).asBlockPos();
}

function equalItem(item as IItemStack, otherItem as IItemStack) as bool {
    if(item.definition.id == otherItem.definition.id && item.metadata == otherItem.metadata) {
        if(!item.hasTag || (item.hasTag && otherItem.hasTag && item.tag.asString() == otherItem.tag.asString())) {
            return true;
        }
    }
    return false;
}