#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.entity.IEntityItem;

import crafttweaker.event.WorldTickEvent;

import scripts.grassUtils.EventUtils;
import scripts.crafttweaker.util.StarLightUtils;


var twoItemRecipe as IItemStack[][int] = {
    20 : [<astralsorcery:blockcustomore:1>, <minecraft:gunpowder>, <minecraft:iron_ore>, <minecraft:redstone>]
};


events.onWorldTick(function(event as WorldTickEvent) {
    var world as IWorld = event.world;
    var totalTime as long = world.provider.worldTime;

    if(!world.remote) {
        for entityItem in world.getEntityItems() {
            var item as IItemStack = entityItem.item;
            var nbt as IData = entityItem.nbt.ForgeData;
            var pos as IBlockPos = StarLightUtils.getBlockPosByEntity(entityItem);

            for seconds, recipeBox in twoItemRecipe {
                if(world.getBlockState(pos) == StarLightUtils.fluid && recipeBox[2].matches(item)) {

                    if(isNull(nbt) || isNull(nbt.time) || nbt.time.asLong() == 0) {
                        entityItem.setNBT({time : (totalTime + (seconds * 20)) as long});
                    } else if(totalTime >= nbt.time.asLong() && !isNull(nbt.needMaterial) && !nbt.needMaterial.asBool()) {

                        if(item.amount >= 1) {
                            entityItem.setNBT({time : 0});
                            entityItem.setNBT({needMaterial : true});
                        }

                        if(!isNull(nbt.playerName)) {
                            StarLightUtils.sendChatByPlayerName(world, nbt.playerName, "icr.text.info.recipecompleted");
                        }

                        item.mutable().shrink(1);
                        world.setBlockState(<blockstate:minecraft:air>, pos);
                        EventUtils.spawnItem(world, recipeBox[0], pos.up());
                    }

                    for entity in world.getEntitiesInArea(pos.asPosition3f()) {
                        var otherPos as IBlockPos = StarLightUtils.getBlockPosByEntity(entity);

                        if(entity instanceof IEntityItem && world.getBlockState(otherPos) == StarLightUtils.fluid) {
                            var otherItem as IEntityItem = entity;

                            if(recipeBox[3].matches(otherItem.item) && (isNull(nbt.needMaterial) || !isNull(nbt.needMaterial) && nbt.needMaterial.asBool())) {
                                otherItem.item.mutable().shrink(1);
                                entityItem.setNBT({needMaterial : false});
                                EventUtils.spawnItem(world, recipeBox[1], otherPos.up());
                            }
                        }
                    }
                }
            }
        }
    }
});