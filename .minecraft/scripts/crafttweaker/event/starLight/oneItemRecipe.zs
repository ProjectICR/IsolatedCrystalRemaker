#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;

import crafttweaker.event.WorldTickEvent;

import scripts.grassUtils.EventUtils;
import scripts.crafttweaker.util.StarLightUtils;


var oneItemRecipe as IItemStack[][int] = {
    120 : [<astralsorcery:itemrockcrystalsimple>.withTag({astralsorcery : {crystalProperties : {collectiveCapability : 50, size : 200, fract : 0, purity : 50, sizeOverride : -1}}}), <minecraft:diamond>],
    5 : [<astralsorcery:blockaltar>, <avaritia:compressed_crafting_table>]
};


events.onWorldTick(function(event as WorldTickEvent) {
    var world as IWorld = event.world;
    var totalTime as long = world.provider.worldTime;

    if(!world.remote) {
        for entityItem in world.getEntityItems() {
            var item as IItemStack = entityItem.item;
            var nbt as IData = entityItem.nbt.ForgeData;
            var pos as IBlockPos = StarLightUtils.getBlockPosByEntity(entityItem);

            for seconds, recipeBox in oneItemRecipe {
                if(world.getBlockState(pos) == StarLightUtils.fluid && recipeBox[1].matches(item) && !<minecraft:stone>.matches(item)) {

                    if(isNull(nbt) || isNull(nbt.time) || nbt.time.asLong() == 0) {
                        entityItem.setNBT({time : (totalTime + (seconds * 20)) as long});
                    } else if(totalTime >= nbt.time.asLong()) {

                        if(item.amount >= 1) {
                            entityItem.setNBT({time : 0});
                        }

                        if(!isNull(nbt.playerName)) {
                            var playerName as string = nbt.playerName.asString();

                            StarLightUtils.sendChatByPlayerName(world, playerName, "icr.text.info.recipecompleted");
                            
                            if(recipeBox[0].matches(<astralsorcery:blockaltar>)) {
                                server.commandManager.executeCommand(server, "astralsorcery research " ~ playerName ~ " BASIC_CRAFT");
                            }
                        }

                        item.mutable().shrink(1);
                        world.setBlockState(<blockstate:minecraft:air>, pos);
                        EventUtils.spawnItem(world, recipeBox[0], pos.up());
                    }
                }
            }
        }
    }
});