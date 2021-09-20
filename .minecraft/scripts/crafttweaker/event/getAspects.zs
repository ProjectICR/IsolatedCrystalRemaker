#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.block.IBlock;
import crafttweaker.world.IWorld;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;

import crafttweaker.event.PlayerInteractBlockEvent;

import mods.ctintegration.data.DataUtil.fromJson;

import scripts.grassUtils.EventUtils;
import scripts.crafttweaker.util.RequiousUtils.getCrystal;


static crystal_essence as IBlockState[][string] = {
	"aer"   : [<blockstate:minecraft:stone>],
	"terra" : [<blockstate:minecraft:dirt>, <blockstate:minecraft:grass>],
	"ignis" : [<blockstate:minecraft:torch>]
};

static aqua_ as IBlockState[IBlockState] = {
	<blockstate:minecraft:leaves>  : <blockstate:contenttweaker:dead_leaves>,
	<blockstate:minecraft:sapling> : <blockstate:minecraft:deadbush>,
};

static data as IData = {PlayerPersisted : {Get : {aer : 0 as int, terra : 0 as int, ignis : 0 as int, aqua : 0 as int}}};

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
	var player as IPlayer = event.player;
	var world as IWorld = player.world;
	var item as IItemStack = event.item;
	var block as IBlock = event.block;
	var pos as IBlockPos = event.position;

	if(!world.remote && !isNull(item) && item.definition.id == "contenttweaker:glass_fragment") {
		if(isNull(player.data.PlayerPersisted.Get)){
			player.update(data);
		}

		for input, output in aqua_ {
			var dataAqua as int = player.data.PlayerPersisted.Get.aqua.asInt();

			if(block.definition.id == input.block.definition.id && player.data.PlayerPersisted.Get.aqua.asInt() < 15) {
				item.mutable().shrink(1);
				world.setBlockState(output, pos);
				player.update({PlayerPersisted : {Get : {aqua : (dataAqua + 1)}}});
				EventUtils.spawnItem(world, getCrystal("aqua"), pos.up());
				break;
			}
		}

		for output, inputBlocks in crystal_essence {
			for inputBlock in inputBlocks {
				if(inputBlock.block.definition.id == block.definition.id) {
					var dataNow as int = player.data.PlayerPersisted.Get.memberGet(output).asInt();

					if(dataNow < 25) {
						var dataModify as IData = fromJson('{"PlayerPersisted" : {Get : {"' + output + '" : ' + (dataNow + 1) + '}}}');

						item.mutable().shrink(1);
						player.update(dataModify);
						EventUtils.spawnItem(world, getCrystal(output), pos.up());
					}
					break;
				}
			}
		}
	}
});