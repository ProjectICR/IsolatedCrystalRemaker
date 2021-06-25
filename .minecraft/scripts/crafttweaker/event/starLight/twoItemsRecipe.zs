#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.entity.IEntityItem;

import crafttweaker.event.WorldTickEvent;

import scripts.grassUtils.EventUtils;
import scripts.crafttweaker.event.starLight.starLight;


var twoItemRecipe as IItemStack[][int] = {
    20 : [<astralsorcery:blockcustomore:1>, <minecraft:gunpowder>, <minecraft:iron_ore>, <minecraft:redstone>]
};


events.onWorldTick(function(event as WorldTickEvent) {
    var world as IWorld = event.world;

    if(!world.remote) {
        for entityItem in world.getEntityItems() {
            var nbt as IData = entityItem.nbt;
            var pos as IBlockPos = starLight.getBlockPos(entityItem);
            var item as IItemStack = entityItem.item;

            for seconds, recipeBox in twoItemRecipe {
                if(world.getBlockState(pos) == starLight.blockFluid && starLight.equalItem(item, recipeBox[2])) {

                    if(isNull(nbt.ForgeData) || isNull(nbt.ForgeData.time)) {
                        entityItem.setNBT({time : 0});
                    } else if(!isNull(nbt.ForgeData.needMaterial)) {
                        entityItem.setNBT({time : nbt.ForgeData.time.asInt() + 1});
                    }

                    nbt = nbt.ForgeData;
                    for entity in world.getEntitiesInArea(pos.asPosition3f()) {
                        var otherPos as IBlockPos = starLight.getBlockPos(entity);

                        if(entity instanceof IEntityItem && world.getBlockState(otherPos) == starLight.blockFluid) {
                            var OEI as IEntityItem = entity;

                            if(starLight.equalItem(OEI.item, recipeBox[3]) && isNull(nbt.needMaterial)) {
                                OEI.item.mutable().shrink(1);
                                entityItem.setNBT({needMaterial : false});
                                EventUtils.spawnItem(world, recipeBox[1], otherPos.up());
                            }
                        }
                    }

                    if(starLight.timer(nbt, seconds)) {
                        item.mutable().shrink(1);
                        world.setBlockState(<blockstate:minecraft:air>, pos);
                        EventUtils.spawnItem(world, recipeBox[0], pos.up());

                        if(!isNull(nbt.playerName)) {
                            world.getPlayerByName(nbt.playerName.asString()).sendChat("合成完毕");
                        }
                    }
                }
            }
        }
    }
});