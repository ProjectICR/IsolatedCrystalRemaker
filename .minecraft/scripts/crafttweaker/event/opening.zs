#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.block.IBlock;
import crafttweaker.world.IWorld;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.damage.IDamageSource;

import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerCraftedEvent;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.event.PlayerInteractBlockEvent;

import mods.ctintegration.data.DataUtil.fromJson;

import scripts.grassUtils.GrassUtils;
import scripts.grassUtils.EventUtils;

static data as IData = {PlayerPersisted : {Get : {aer : 0 as int, terra : 0 as int, ignis : 0 as int, aqua : 0 as int}}};
static crystal_essence as IBlockState[][string] = {
	"aer"   : [<blockstate:minecraft:stone>],
	"terra" : [<blockstate:minecraft:dirt>, <blockstate:minecraft:grass>],
	"ignis" : [<blockstate:minecraft:torch>]
};
static aqua_ as IBlockState[IBlockState] = {
	<blockstate:minecraft:leaves>  : <blockstate:contenttweaker:dead_leaves>,
	<blockstate:minecraft:sapling> : <blockstate:minecraft:deadbush>,
};

events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
	var player as IPlayer = event.player;
	var blockName as string = event.block.definition.id;

	if(!event.isPlayer || event.silkTouch) return;

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

events.onPlayerCrafted(function(event as PlayerCraftedEvent){
	var player as IPlayer = event.player;
	var world as IWorld = player.world;
	var heldItem as IItemStack = player.currentItem;

	if(!world.remote && !isNull(heldItem)) {
		var heldItemID as string = heldItem.definition.id;

		if(heldItemID == "extendedcrafting:handheld_table" || heldItemID == "actuallyadditions:item_crafter_on_a_stick") {
			player.attackEntityFrom(IDamageSource.createPlayerDamage(player), 10);
			player.update({PlayerPersisted : {handHeldTable : true as bool}});
		}
	}
});

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
	var player as IPlayer = event.player;
	var world as IWorld = player.world;
	var item as IItemStack = event.item;
	var block as IBlock = event.block;
	var pos as IBlockPos = event.position;


	if(!world.remote && !isNull(item)) {
		var itemName as string = item.definition.id;
		var blockName as string = block.definition.id;

		if(itemName == "extendedcrafting:handheld_table" || itemName == "actuallyadditions:item_crafter_on_a_stick") {
			if(blockName == "minecraft:crafting_table" || (blockName == "tconstruct:tooltables" && block.meta == 0)) {
				event.cancellationResult =  "PASS";
				event.cancel();
			}
		}
	}

	if(!world.remote && !isNull(item) && item.definition.id == "contenttweaker:glass_fragment") {
		if(isNull(player.data.PlayerPersisted.Get)){
			player.update(data);
		}

		for input, output in aqua_ {
			var dataAqua as int = player.data.PlayerPersisted.Get.aqua.asInt();

			if(block.definition.id == input.block.definition.id && player.data.PlayerPersisted.Get.aqua.asInt() < 15) {
				item.mutable().shrink(1);
				EventUtils.spawnItem(world, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}), pos.up());
				player.update({PlayerPersisted : {Get : {aqua : (dataAqua + 1)}}});
				world.setBlockState(output, pos);
			}
		}

		for input, outputs in crystal_essence {
			for output in outputs {
				if(item.definition.id == "contenttweaker:glass_fragment" && isNull(item.tag.Aspects) && output.block.definition.id == block.definition.id){
					var dataNow as int = player.data.PlayerPersisted.Get.memberGet(input).asInt();

					if(dataNow < 25){
						var dataModify as IData = fromJson('{"PlayerPersisted" : {Get : {"' + input + '" : ' + (dataNow + 1) + '}}}');

						item.mutable().shrink(1);
						EventUtils.spawnItem(world, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: input}]}), pos.up());
						player.update(dataModify);
					}
				}
			}
		}
	}
});

events.onPlayerRespawn(function(event as PlayerRespawnEvent){
	var player as IPlayer = event.player;

	if(!isNull(player.data.PlayerPersisted.handHeldTable) && player.data.PlayerPersisted.handHeldTable.asBool()){
		player.update({PlayerPersisted : {handHeldTable : false as bool}});
		player.sendChat(GrassUtils.i18n("icr.text.info.handHeldTable"));
		player.give(<minecraft:apple> * 5);
	}
});