#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.player.IPlayer;
import crafttweaker.block.IBlockState;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;

import crafttweaker.event.PlayerCraftedEvent;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.event.PlayerInteractBlockEvent;

events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
	var player as IPlayer = event.player;
	var world as IWorld = player.world;
	var block as IBlock = event.block;

	if(!event.isPlayer || event.silkTouch || player.isFake()) return;

	if(!world.remote){
		if(block.definition.id == "minecraft:glass"){
			var random as int = world.random.nextInt(1, 3);
			event.drops = [<contenttweaker:glass_fragment> * random];
		}
	}
});

events.onPlayerCrafted(function(event as PlayerCraftedEvent){
	var player as IPlayer = event.player;
	var world as IWorld = player.world;

	if(!world.remote && player.currentItem.definition.id == "extendedcrafting:handheld_table"){
		player.attackEntityFrom(<damageSource:MAGIC>, 10);
	}
});

// events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
// 	var player as IPlayer = event.player;
// 	var world as IWorld = player.world;
// 	var item as IItemStack = event.item;
// 	var block as IBlock = event.world;

// 	if(!world.remote && !isNull(item) && item.definition.id == "contenttweaker:glass_fragment") {
		
// 	}
// });