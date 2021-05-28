#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.player.IPlayer;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;

import mods.randomtweaker.IMouse;

import crafttweaker.event.PlayerRightClickItemEvent;

events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {
	var item as IItemStack = event.item;
	var world as IWorld = event.world;

	if (!world.remote && item.definition.id == "thaumcraft:thaumometer"){
		var pos as IBlockPos = IMouse.getMouseHitBlockPos();
		var block as IBlock = world.getBlock(pos);

		if(!isNull(block.data) && !isNull(block.data.subTileName) && block.data.subTileName == "hydroangeas"){
			world.performExplosion(null, pos.x, pos.y, pos.z, 3, true, true);
			event.player.sendChat(game.localize("icr.thaumometer.explode"));
			event.cancel();
		}
	}
});