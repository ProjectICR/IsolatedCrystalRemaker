#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;

import crafttweaker.event.WorldTickEvent;

import scripts.grassUtils.EventUtils;
import scripts.crafttweaker.event.starLight.starLight;


var oneItemRecipe as IItemStack[][int] = {
    120 : [<astralsorcery:itemrockcrystalsimple>.withTag({astralsorcery : {crystalProperties : {collectiveCapability : 50, size : 200, fract : 0, purity : 50, sizeOverride : -1}}}), <minecraft:diamond>],
    30 : [<astralsorcery:blockaltar>, <avaritia:compressed_crafting_table>]
};


events.onWorldTick(function(event as WorldTickEvent) {
    var world as IWorld = event.world;

    if(!world.remote) {
        for entityItem in world.getEntityItems() {
            var nbt as IData = entityItem.nbt;
            var item as IItemStack = entityItem.item;
            var pos as IBlockPos = starLight.getBlockPos(entityItem);

            for seconds, recipeBox in oneItemRecipe {
                if(world.getBlockState(pos) == starLight.blockFluid && starLight.equalItem(item, recipeBox[1]) && !starLight.equalItem(item, <minecraft:stone>)) {

                    if(isNull(nbt.ForgeData) || isNull(nbt.ForgeData.time)) {
                        entityItem.setNBT({time : 0});
                    } else if(!isNull(nbt.ForgeData.time)) {
                        entityItem.setNBT({time : nbt.ForgeData.time.asInt() + 1});
                    }

                    nbt = nbt.ForgeData;
                    if(starLight.timer(nbt, seconds)) {
                        item.mutable().shrink(1);
                        world.setBlockState(<blockstate:minecraft:air>, pos);
                        EventUtils.spawnItem(world, recipeBox[0], pos.up());

                        if(!isNull(nbt.playerName)) {
                            var playerName as string = nbt.playerName.asString();

                            if(starLight.equalItem(recipeBox[0], <astralsorcery:blockaltar>)) {
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