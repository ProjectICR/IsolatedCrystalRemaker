#priority 100
#loader contenttweaker
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;

import mods.contenttweaker.Item;
import mods.contenttweaker.ActionResult;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.ResourceLocation;

import scripts.grassUtils.GrassUtilsCot as GrassUtils;


var iProduct as Item = VanillaFactory.createItem("intermediate_product");
iProduct.creativeTab = <creativetab:materials.base>;
iProduct.setLocalizedNameSupplier(function(itemStack) {
    var tag as IData = itemStack.tag;

    if(!isNull(tag.type)) {
        tag = tag.type;
        
        var material as string = tag.asString().split("_")[0];
        var type as string = tag.asString().split("_")[1];

        return GrassUtils.i18nValued("icr.localization.intermediate_product", 
            [GrassUtils.i18nValued("base.part." ~ type, [GrassUtils.i18n("base.material." ~ material)])]);
    }
    return GrassUtils.i18n("item.contenttweaker.intermediate_product.name");
});
iProduct.register();


/*
var bowl as Item = VanillaFactory.createItem("water_bowl");
bowl.creativeTab = <creativetab:materials.base>;
bowl.textureLocation = ResourceLocation.create("actuallyadditions:items/item_water_bowl");
bowl.onItemUse = function(player, world, pos, hand, facing, blockHit) {
    var blockData as IData = world.getBlock(pos.x, pos.y, pos.z).data;
    var data as IData = {isMossy: 0 as byte, Size: 16, hasWater: 1 as byte, Items: [], id: "botania:altar", hasLava: 0 as byte};

    if(world.getBlockState(pos).block.definition.id == "botania:altar") {
        if(!isNull(blockData.hasWater) && !blockData.hasWater.asBool()) {
            world.setBlockState(<block:botania:altar>, data, pos);
            player.setItemToSlot(IEntityEquipmentSlot.mainHand(), <item:minecraft:bowl>);
            return ActionResult.success();
        }
    }
    return ActionResult.pass();
};
bowl.register();
*/