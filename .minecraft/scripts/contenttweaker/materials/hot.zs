#priority 100
#loader contenttweaker
import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;


var hotList as int[string] = {
    "Steel" : 0x696969,
    "Castediron" : 0x727682,
    "Wroughtiron" : 0x595050
};

var hotHelper as MaterialSystemHelper = CotUtils.getMaterialSystemHelper("hot_helper");
hotHelper.addPart("plate");
hotHelper.addPart("ingot");
hotHelper.registerNormalPart("rotor", "item", false);
hotHelper.registerNormalPart("hot_plate", "item", true);
hotHelper.registerNormalPart("hot_ingot", "item", false);
hotHelper.registerNormalPart("quenched_plate", "item", true);

for name, color in hotList {
    hotHelper.registerMaterial(name, color);
}

hotHelper.registerAllMaterialParts();