#priority 100
#loader contenttweaker
import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;


var hotList as int[string] = {
    "Steel" : 0x696969,
    "Castediron" : 0x727682,
    "Wroughtiron" : 0x595050
};

var hotSystem as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(1);
hotSystem.addPart("plate");
hotSystem.addPart("ingot");
hotSystem.registerNormalPart("rotor", "item", false);
hotSystem.registerNormalPart("hot_plate", "item", true);
hotSystem.registerNormalPart("hot_ingot", "item", false);
hotSystem.registerNormalPart("quenched_plate", "item", true);

for name, color in hotList {
    hotSystem.registerMaterial(name, color);
}

hotSystem.registerAllMaterialParts();