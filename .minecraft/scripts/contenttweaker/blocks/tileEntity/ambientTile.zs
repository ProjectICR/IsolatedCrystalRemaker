#priority 101
#loader contenttweaker

import mods.zenutils.cotx.TileEntity;
import mods.contenttweaker.VanillaFactory;

import crafttweaker.data.IData;

static teSL as TileEntity = VanillaFactory.createActualTileEntity(0);
teSL.onTick = function(tileEntity, world, pos) {
    var data as IData = tileEntity.data;

    if(isNull(data.worldTime)) {
        tileEntity.updateCustomData({worldTime : 0});
    }

    if(!world.remote && !world.dayTime && !isNull(data.worldTime) && !isNull(data.hasMana) && data.hasMana.asBool()) {
        tileEntity.updateCustomData({worldTime : data.worldTime.asInt() + 1});

        if(data.worldTime.asInt() != 0 && data.worldTime >= 1200) {
            world.setBlockState(<block:astralsorcery:fluidblockliquidstarlight>, pos);
        }
    }
};
teSL.register();
