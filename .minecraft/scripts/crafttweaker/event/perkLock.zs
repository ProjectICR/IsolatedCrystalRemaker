#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.player.IPlayer;

import crafttweaker.event.PlayerTickEvent;

events.onPlayerTick(function(event as PlayerTickEvent) {
    var player as IPlayer = event.player;
    
    if(!player.world.remote && player.getPerkExp() > 528614.0) {
        server.commandManager.executeCommand(server, "astralsorcery exp " ~ player.name ~ " 528614");
    }
});