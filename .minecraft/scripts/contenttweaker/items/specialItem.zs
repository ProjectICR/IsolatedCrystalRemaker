#priority 100
#loader contenttweaker
import crafttweaker.data.IData;

import mods.contenttweaker.Item;
import mods.contenttweaker.VanillaFactory;

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