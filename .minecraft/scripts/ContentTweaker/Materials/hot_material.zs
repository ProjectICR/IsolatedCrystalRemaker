#priority 100
#loader contenttweaker
import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;


var hotIngotList as string[int] = {
    0x727682 : "Castediron",
    0x595050 : "Wroughtiron"
};

var hotSystem as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(1);
hotSystem.addPart("plate");
hotSystem.registerNormalPart("hot_ingot", "item", false);
hotSystem.registerNormalPart("hot_plate", "item", true);
hotSystem.registerNormalPart("quenched_plate", "item", true);

for color, name in hotIngotList {
    hotSystem.registerMaterial(name, color);
}

hotSystem.registerAllMaterialParts();