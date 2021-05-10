#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.player.IPlayer;
import crafttweaker.block.IBlockState;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;

import crafttweaker.event.BlockPlaceEvent;
import crafttweaker.event.PlayerInteractBlockEvent;

var aspects as string[int] = {
	11546150 : "ignis",
	6192150 : "terra",
	16701501 : "aer",
	3847130 : "aqua",
	16383998 : "ordo",
	1908001 : "perditio"
};

events.onBlockPlace(function(event as BlockPlaceEvent){
	var player as IPlayer = event.player;
	var world as IWorld = player.world;
	var pos as IBlockPos = event.position;
	var block as IBlock = event.block;

	if(!world.remote){
		if(block.definition.id == "minecraft:sapling" && block.meta == 0){
			var allInBlox as IBlockPos[] = getAllInBox(pos.add(1, 0, 1), pos.add(-1 as int, 0, -1 as int));
			for b in allInBlox{
				print("y:" + b.x);
				if(!isNull(world.getBlock(b))){
					if(world.getBlock(b).definition.id == "minecraft:cauldron"){
						event.cancel();
					}
				}
			}
		}
	}
});

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent){
	var player as IPlayer = event.player;
	var world as IWorld = player.world;
	var item as IItemStack = event.item;
	var pos as IBlockPos = event.position;
	var block as IBlock = world.getBlock(pos.x, pos.y, pos.z);
	var blocks as IBlockState = world.getBlockState(pos);

	if(!world.remote && !isNull(item) && block.definition.id == "minecraft:cauldron" && block.meta != 0){
		if(!isNull(block.data.state.color)){
			if(item.definition.id == "contenttweaker:glass_fragment"){
				for color, name in aspects{
					if(color == block.data.state.color.asInt()){
						item.mutable().shrink(1);
						player.give(itemUtils.getItem("thaumcraft:crystal_essence").withTag({Aspects: [{amount: 1, key: name}]}));
						world.setBlockState((blocks.withProperty("level", toString(block.meta - 1))), pos);
						break;	
					}
				}
			}else if(item.definition.id == "minecraft:sapling" && block.data.state.color.asInt() == 16383998 && block.meta == 3){
				item.mutable().shrink(1);
				player.give(<minecraft:sapling:2>);
				world.setBlockState((blocks.withProperty("level", "0")), pos);
			}
			
		}
	}
});

