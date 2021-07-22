#loader crafttweaker reloadableevents
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;

import crafttweaker.event.ItemTossEvent;

import mods.ctutils.utils.Math;

static fluid as IBlockState = <blockstate:astralsorcery:fluidblockliquidstarlight>;

events.onItemToss(function(event as ItemTossEvent) {
    var player as IPlayer = event.player;

    if(!player.world.remote) {
        event.item.setNBT({playerName : player.name});
    }
});

function getFluid() as IBlockState {
    return fluid;
}

function getBlockPosByEntity(entity as IEntity) as IBlockPos {
    return Position3f.create(Math.floor(entity.x), Math.floor(entity.y), Math.floor(entity.z)).asBlockPos();
}