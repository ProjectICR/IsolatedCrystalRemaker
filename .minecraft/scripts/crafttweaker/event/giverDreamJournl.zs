#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

import crafttweaker.event.PlayerItemPickupEvent;

import mods.ctintegration.data.DataUtil.fromJson;


static crystal_essence as string[] = ["aer", "terra", "ignis", "aqua", "ordo", "perditio"];

events.onPlayerItemPickup(function(event as PlayerItemPickupEvent) {
	var player as IPlayer = event.player;
	var item as IItemStack = event.stackCopy;
	var playerData as IData = player.data.PlayerPersisted;
	
	if(!player.world.remote && !isNull(item)) {
		if(item.definition.id == "thaumcraft:crystal_essence" && isNull(playerData.GiverDreamJournl)) {

			for essence in crystal_essence {
				var temp as IData = playerData.FirstGet.memberGet(essence);
				if(isNull(temp) || !temp.asBool()) return;
			}

			giverDreamJournl(player);
			player.update({PlayerPersisted : {GiverDreamJournl : true as bool}});
		}
	}
});