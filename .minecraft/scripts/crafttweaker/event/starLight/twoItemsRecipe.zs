#priority -1
#loader crafttweaker
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.entity.IEntityItem;

import crafttweaker.event.WorldTickEvent;

import scripts.grassUtils.EventUtils;
import scripts.crafttweaker.event.starLight.starLight.timer;
import scripts.crafttweaker.event.starLight.starLight.starLight;
import scripts.crafttweaker.event.starLight.starLight.getBlockPos;


var twoItemRecipe as IItemStack[][int] = {
    20 : [<astralsorcery:blockcustomore:1>, <minecraft:gunpowder>, <minecraft:iron_ore>, <minecraft:redstone>]
};


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