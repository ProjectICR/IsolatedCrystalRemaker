#priority -1
#loader crafttweaker
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;

import crafttweaker.event.WorldTickEvent;

import scripts.grassUtils.EventUtils;
import scripts.crafttweaker.event.starLight.starLight.timer;
import scripts.crafttweaker.event.starLight.starLight.starLight;
import scripts.crafttweaker.event.starLight.starLight.getBlockPos;


var oneItemRecipe as IItemStack[][int] = {
    120 : [<astralsorcery:itemrockcrystalsimple>.withTag({astralsorcery : {crystalProperties : {collectiveCapability : 50, size : 200, fract : 0, purity : 50, sizeOverride : -1}}}), <minecraft:diamond>],
    30 : [<astralsorcery:blockaltar>, <avaritia:compressed_crafting_table>]
};


events.onWorldTick(function(event as WorldTickEvent) {
    var world as IWorld = event.world;

    if(!world.remote) {
        for entityItem in world.getEntityItems() {
            var nbt as IData = entityItem.nbt;
            var pos as IBlockPos = getBlockPos(entityItem);

            for seconds, recipeBox in oneItemRecipe {
                if(world.getBlockState(pos) == starLight && entityItem.item.matches(recipeBox[1])) {

                    if(entityItem.item.matches(<minecraft:stone>)) {
                        return;
                    }

                    if(isNull(nbt.ForgeData) || isNull(nbt.ForgeData.time)) {
                        entityItem.setNBT({time : 0});
                    } else {
                        entityItem.setNBT({time : nbt.ForgeData.time.asInt() + 1});
                    }

                    nbt = entityItem.nbt.ForgeData;
                    if(timer(nbt, seconds)) {
                        entityItem.setDead();
                        world.setBlockState(<blockstate:minecraft:air>, pos);
                        EventUtils.spawnItem(world, recipeBox[0], pos.add(0, 1, 0));

                        if(!isNull(nbt.playerName)) {
                            var playerName as string = nbt.playerName.asString();

                            if(recipeBox[0].matches(<astralsorcery:blockaltar>)) {
                                server.commandManager.executeCommand(server, "astralsorcery research " ~ playerName ~ " BASIC_CRAFT");
                            }

                            world.getPlayerByName(playerName).sendChat("合成完毕");
                        }           
                    }
                }
            }
        }
    }
});