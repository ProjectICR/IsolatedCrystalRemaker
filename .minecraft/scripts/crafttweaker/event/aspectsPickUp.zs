#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

import crafttweaker.event.PlayerItemPickupEvent;

import mods.ctintegration.data.DataUtil.fromJson;

import scripts.grassUtils.GrassUtils;


events.onPlayerItemPickup(function(event as PlayerItemPickupEvent) {
    var player as IPlayer = event.player;
    var item as IItemStack = event.stackCopy;
    var playerData as IData = player.data.PlayerPersisted;

    if(!player.world.remote && !isNull(item) && item.definition.id == "thaumcraft:crystal_essence" && item.hasTag) {
        var key as string = item.tag.Aspects[0].key.asString();
        var data as IData = fromJson('{"PlayerPersisted" : {FirstGet : {"' + key + '" : true}}}');

        if(isNull(playerData.FirstGet) || isNull(playerData.FirstGet.memberGet(key))) {
            var langkey as string = "icr.text.info.crystal." ~ key;
            var message as string = GrassUtils.i18n(langkey);

            if(!isNull(message) || message != "" || message != langkey) {
                player.sendChat(message);
            }
        }

        player.update(data);
    }
});