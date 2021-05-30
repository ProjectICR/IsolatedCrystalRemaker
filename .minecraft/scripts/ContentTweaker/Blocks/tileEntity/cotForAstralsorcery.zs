#priority 100
#loader contenttweaker

import mods.zenutils.cotx.Block;
import mods.zenutils.cotx.TileEntity;
import mods.contenttweaker.VanillaFactory;
import mods.zenutils.cotx.TileEntityInGame;

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityEquipmentSlot;

var teSL as TileEntity = VanillaFactory.createActualTileEntity(0);
teSL.onTick = function(tileEntity, world, pos) {
    var data as IData = tileEntity.data;

    if(isNull(data.worldTime)) {
        tileEntity.updateCustomData({worldTime : 0});
    }

    if(!world.remote && !world.dayTime && !isNull(data.hasManaCapacity) && data.hasManaCapacity.asBool()) {
        tileEntity.updateCustomData({worldTime : (data.worldTime.asInt() + 1)});

        if(data.worldTime.asInt() != 0 && data.worldTime % 1200 == 0) {
            world.setBlockState(<block:astralsorcery:fluidblockliquidstarlight>, pos);
        }
    }
};
teSL.register();

var starLight as Block = VanillaFactory.createExpandBlock("ambient_block", <blockmaterial:leaves>);
starLight.tileEntity = teSL;
starLight.onBlockActivated = function(world, pos, state, player, hand, facing, blockHit) {
    var mainHand as IEntityEquipmentSlot = IEntityEquipmentSlot.mainHand();
    var mainHandItem as IItemStack = player.getItemInSlot(mainHand);

    if(player.hasItemInSlot(mainHand) && mainHandItem.definition.id == "botania:manatablet" && !isNull(mainHandItem.tag.mana)) {
        var manaCapacity as int = mainHandItem.tag.mana.asInt();
        var tile as TileEntityInGame = world.getCustomTileEntity(pos);

        if(!world.remote && manaCapacity >= 10000 && isNull(tile.data.manaCapacity)) {
            if(!isNull(mainHandItem.tag.creative)) {
                tile.updateCustomData({hasManaCapacity : true});
            } else {
                
                mainHandItem.mutable().withTag({mana : (manaCapacity - 10000)});
                tile.updateCustomData({hasManaCapacity : true});
            }
            return true;
        }
    }
    return false;
};
starLight.register();