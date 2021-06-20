#priority -1
#loader crafttweaker
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.world.IFacing;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.item.IItemStack;
import crafttweaker.util.Position3f;
import crafttweaker.block.IBlockState;
import crafttweaker.entity.IEntityItem;

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.PlayerItemPickupEvent;

import mods.ctintegration.data.DataUtil.fromJson;


static crystal_essence as string[] = ["aer", "terra", "ignis", "aqua", "ordo", "perditio"];
static data as IData = {PlayerPersisted : {aer : 0 as int, terra : 0 as int, ignis : 0 as int, aqua : 0 as int, ordo : 0 as int, perditio : 0 as int}};

events.onPlayerItemPickup(function(event as PlayerItemPickupEvent) {
	var player as IPlayer = event.player;
	var world as IWorld = player.world;
	var item as IItemStack = event.stackCopy;
	
	if(!world.remote && !isNull(item)) {
		if(item.definition.id == "thaumcraft:crystal_essence" && isNull(player.data.PlayerPersisted.GiverDreamJournl)) {
			var keyValue as string = item.tag.Aspects[0].key.asString();
			var data as IData = fromJson('{"PlayerPersisted" : {"' + keyValue + '" : 1}}');
			player.update(data);

			for essence in crystal_essence {
				var temp as IData = player.data.PlayerPersisted.memberGet(essence);
				if(isNull(temp) || temp.asInt() == 0) return;
			}
			giverDreamJournl(player);
			player.update({PlayerPersisted : {GiverDreamJournl : true as bool}});
		}
	}
});

