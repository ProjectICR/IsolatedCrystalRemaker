#loader crafttweaker
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.world.IFacing;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.item.IItemStack;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.entity.IEntityItem;

import crafttweaker.event.ItemTossEvent;
import crafttweaker.event.WorldTickEvent;

import mods.ctutils.utils.Math;

import scripts.grassUtils.EventUtils;

function timer(nbt as IData, seconds as int) as bool {
    return !isNull(nbt.time) && nbt.time.asInt() != 0 && nbt.time.asInt() % (seconds * 20) == 0;
}

function getBlockPos(entity as IEntity) as IBlockPos {
    return Position3f.create(Math.floor(entity.x), Math.floor(entity.y), Math.floor(entity.z)).asBlockPos();
}

static starLight as IBlockState = <blockstate:astralsorcery:fluidblockliquidstarlight>;

var oneItemRecipe as IItemStack[][int] = {
    120 : [<astralsorcery:itemrockcrystalsimple>.withTag({astralsorcery : {crystalProperties : {collectiveCapability : 50, size : 200, fract : 0, purity : 50, sizeOverride : -1}}}), <minecraft:diamond>],
    30 : [<astralsorcery:blockaltar>, <avaritia:compressed_crafting_table>]
};

var twoItemRecipe as IItemStack[][int] = {
    20 : [<astralsorcery:blockcustomore:1>, <minecraft:gunpowder>, <minecraft:iron_ore>, <minecraft:redstone>]
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

events.onWorldTick(function(event as WorldTickEvent) {
    var world as IWorld = event.world;

    if(!world.remote) {
        for entityItem in world.getEntityItems() {
            var nbt as IData = entityItem.nbt;
            var pos as IBlockPos = getBlockPos(entityItem);

            for seconds, recipeBox in twoItemRecipe {
                if(world.getBlockState(pos) == starLight && entityItem.item.matches(recipeBox[2])) {

                    if(isNull(nbt.ForgeData) || isNull(nbt.ForgeData.time)) {
                        entityItem.setNBT({time : 0});
                    } else if(!isNull(nbt.ForgeData.needMaterial)) {
                        entityItem.setNBT({time : nbt.ForgeData.time.asInt() + 1});
                    }

                    nbt = entityItem.nbt.ForgeData;
                    for entity in world.getEntitiesInArea(pos.asPosition3f()) {
                        var otherPos as IBlockPos = getBlockPos(entityItem);

                        if(entity instanceof IEntityItem && world.getBlockState(otherPos) == starLight) {
                            var otherEntityItem as IEntityItem = entity;

                            if(otherEntityItem.item.matches(recipeBox[3]) && isNull(nbt.needMaterial)) {
                                entity.setDead();
                                entityItem.setNBT({needMaterial : false});
                                EventUtils.spawnItem(world, recipeBox[1], otherPos.add(0, 1 ,0));
                            }
                        }
                    }

                    if(timer(nbt, seconds) && !isNull(nbt.needMaterial)) {
                        entityItem.setDead();
                        world.setBlockState(<blockstate:minecraft:air>, pos);
                        EventUtils.spawnItem(world, recipeBox[0], pos.add(0, 1, 0));

                        if(!isNull(nbt.playerName)) {
                            world.getPlayerByName(nbt.playerName.asString()).sendChat("合成完毕");
                        }
                    }
                }
            }
        }
    }
});

events.onItemToss(function(event as ItemTossEvent) {
    var player as IPlayer = event.player;

    if(!player.world.remote) {
        event.item.setNBT({playerName : player.name});
    }
});