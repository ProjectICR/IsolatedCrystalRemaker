#priority 100
#loader contenttweaker
import scripts.grassUtils.CotUtils;
import scripts.grassUtils.classes.MaterialSystemHelper.MaterialSystemHelper;


var materialList as int[string] = {
    "Cesium" : 0x8F8D07,
    "Indium" : 0x8A93A9,
    "Titanium" :  0xB59AFF,
    "Beryllium" : 0x88D461,
    "Germanium" : 0x837E77,
    "Zirconium" : 0x94B4D3,
    "Soldertin" : 0x2A2D0C,
    "Adamantium" : 0x888EDF,
    "Stainlesstitanium" : 0xADD1CC,
    "Berylliumaluminumalloy"  : 0x6C6C6C,
};

var partList as string[] = ["ingot", "dust", "nugget", "plate", "rod", "gear", "dense_plate", "small_dust", "block"];

var oreHelper as MaterialSystemHelper = CotUtils.getMaterialSystemHelper("ore_helper");
oreHelper.registerNormalPart("tiny_dust_icr", "item", false);

for part in partList {
    oreHelper.addPart(part);
}

for name, color in materialList {
    oreHelper.registerMaterial(name, color);
}

oreHelper.registerAllMaterialParts();