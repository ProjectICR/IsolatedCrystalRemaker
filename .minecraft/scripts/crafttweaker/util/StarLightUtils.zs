#priority 30
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;

import crafttweaker.event.ItemTossEvent;

import mods.ctutils.utils.Math;

import scripts.grassUtils.GrassUtils;

static fluid as IBlockState = <blockstate:astralsorcery:fluidblockliquidstarlight>;

events.onItemToss(function(event as ItemTossEvent) {
    var player as IPlayer = event.player;

    if(!player.world.remote) {
        event.item.setNBT({playerName : player.name});
    }
});

function getBlockPosByEntity(entity as IEntity) as IBlockPos {
    return IBlockPos.create(Math.floor(entity.x), Math.floor(entity.y), Math.floor(entity.z));
}

function sendChatByPlayerName(world as IWorld, playerName as string, chat as string) {
    var player as IPlayer = world.getPlayerByName(playerName);

    if(!isNull(player)) {
        player.sendChat(GrassUtils.i18n(chat));
    }
}