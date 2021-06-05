#priority 100
#loader contenttweaker
import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;


var materialList as string[int] = {
    0x8F8D07 : "Cesium",
    0x8A93A9 : "Indium",
    0xB59AFF : "Titanium" ,
    0x88D461 : "Beryllium",
    0x837E77 : "Germanium",
    0x94B4D3 : "Zirconium",
    0x2A2D0C : "Soldertin",
    0x888EDF : "Adamantium",
    0xADD1CC : "Stainlesstitanium",
    0x6C6C6C : "Berylliumaluminumalloy",
};

var hotIngotList as string[int] = {
    0x727682 : "Castediron",
    0x595050 : "Wroughtiron"
};

var partList as string[] = ["ingot", "dust", "nugget", "plate", "rod", "gear", "dense_plate", "small_dust", "block"];

var materialSystem as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(0);
materialSystem.registerNormalPart("tiny_dust_icr", "item", false);

var hotSystem as MaterialSystemHelper = CotUtils.getMaterialSystemHelper(1);
hotSystem.addPart(partList[3]);
hotSystem.registerNormalPart("hot_ingot", "item", false);
hotSystem.registerNormalPart("hot_plate", "item", false);
hotSystem.registerNormalPart("quenched_plate", "item", false);

for part in partList {
    materialSystem.addPart(part);
}

for color, name in materialList {
    materialSystem.registerMaterial(name, color);
}

for color, name in hotIngotList {
    hotSystem.registerMaterial(name, color);
}

materialSystem.registerAllMaterialParts();

hotSystem.registerAllMaterialParts();