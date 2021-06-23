#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.block.IBlock;
import crafttweaker.world.IWorld;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;

import crafttweaker.event.PlayerRightClickItemEvent;

events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {
	var world as IWorld = event.world;
	var item as IItemStack = event.item;
	var player as IPlayer = event.player;

	if (!world.remote && item.definition.id == "thaumcraft:thaumometer"){
		var pos as IBlockPos = player.getRayTrace(6.0, 1.0f).blockPos;
		var block as IBlock = world.getBlock(pos);

		if(!isNull(block.data) && !isNull(block.data.subTileName) && block.data.subTileName == "hydroangeas"){
			world.performExplosion(null, pos.x, pos.y, pos.z, 1, true, true);
			world.performExplosion(null, pos.x, pos.y, pos.z, 2, true, true);
			player.sendChat(game.localize("icr.text.info.explode"));
			event.cancel();
		}
	}
});