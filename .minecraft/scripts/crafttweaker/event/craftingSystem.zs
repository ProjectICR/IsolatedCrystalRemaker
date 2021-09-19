#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.block.IBlock;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.damage.IDamageSource;

import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.PlayerCraftedEvent;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerRightClickItemEvent;

import scripts.grassUtils.GrassUtils;


events.onPlayerCrafted(function(event as PlayerCraftedEvent){
	var player as IPlayer = event.player;
	var world as IWorld = player.world;
	var data as IData = player.data.openHeldTabGui;
	var heldItem as IItemStack = player.currentItem;

	if(!world.remote && !isNull(heldItem) && isHandHeldTable(heldItem) && !isNull(data) && data.asBool()) {
		player.attackEntityFrom(<damageSource:handHeldTable>, 10);
	}
});

events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {
	var block as IBlock = event.block;
	var heldItem as IItemStack = event.item;

	if(!event.world.remote && isHandHeldTable(heldItem)) {
		event.player.update({openHeldTabGui : true as bool});
	}
});

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
	var item as IItemStack = event.item;
	var block as IBlock = event.block;

	if(!event.world.remote && !isNull(item) && isHandHeldTable(item) && isCraftingTab(block)) {
		event.player.update({openHeldTabGui : false as bool});
	}
});

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
	if(event.entityLivingBase instanceof IPlayer) {
		var player as IPlayer = event.entityLivingBase;
		
		if(!player.world.remote && event.damageSource.damageType == "handHeldTable") {
			player.update({PlayerPersisted : {handHeldTable : true as bool}});
		}
	}
});

events.onPlayerRespawn(function(event as PlayerRespawnEvent){
	var player as IPlayer = event.player;
	var playerData as IData = player.data.PlayerPersisted;

	if(!isNull(playerData) && !isNull(playerData.handHeldTable) && playerData.handHeldTable.asBool()){
		player.update({PlayerPersisted : {handHeldTable : false as bool}});
		player.sendChat(GrassUtils.i18n("icr.text.info.handHeldTable"));
		player.give(<minecraft:apple> * 5);
	}
});

function isHandHeldTable(item as IItemStack) as bool {
	var itemName as string = item.definition.id;

	if(itemName == "extendedcrafting:handheld_table" || itemName == "actuallyadditions:item_crafter_on_a_stick") {
		return true;
	}
	return false;
}

function isCraftingTab(block as IBlock) as bool {
	var blockName as string = block.definition.id;

	if(blockName has "crafting_table" || blockName has "extendedcrafting:table" || (blockName == "tconstruct:tooltables" && block.meta == 0)) {
		return true;
	}
	return false;
}