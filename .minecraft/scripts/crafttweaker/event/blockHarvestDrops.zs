#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

import crafttweaker.event.BlockHarvestDropsEvent;


events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
	var player as IPlayer = event.player;
	var blockName as string = event.block.definition.id;

	if(event.silkTouch) return;

	if(!event.world.remote) {
		if(blockName == "minecraft:glass") {
			var random as int = event.world.random.nextInt(1, 3);
			
			event.drops = [<contenttweaker:glass_fragment> * random];
		}

		if(blockName == "contenttweaker:dead_leaves") {
			var heldItem as IItemStack = player.currentItem;
			
			if(isNull(heldItem) || (!isNull(heldItem) && !(heldItem.definition.id has "shears"))) {
				event.drops = [];
			}
		}
	}
});