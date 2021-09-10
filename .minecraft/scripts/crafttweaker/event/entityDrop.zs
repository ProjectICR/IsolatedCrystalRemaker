#priority -1
#loader crafttweaker reloadableevents
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.util.IRandom;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;

import crafttweaker.event.EntityLivingDeathDropsEvent;


events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent) {
    var entity as IEntityLivingBase = event.entityLivingBase;
    var world as IWorld = entity.world;
    var random as IRandom = world.random;
    var amount as int = random.nextInt(1, 4);
    var nbt as IData = entity.nbt.ForgeData;

    if(!world.remote && !entity instanceof IPlayer && !isNull(nbt) && !isNull(nbt.fusion)) {
        event.drops = [<minecraft:bone>.withAmount(amount).createEntityItem(world, entity.position3f)];
        
        if(random.nextDouble() > 0.75) {
            event.addItem(<minecraft:rotten_flesh>.withAmount(amount));
        }

        if(random.nextBoolean()) {
            event.addItem(<minecraft:gunpowder>.withAmount(amount));
        }

        if(random.nextBoolean()) {
            event.addItem(<minecraft:string>.withAmount(amount));
        }

    }
});