#priority 100
#loader contenttweaker
import mods.contenttweaker.Material;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.MaterialBuilder;
import mods.contenttweaker.Part;
import mods.contenttweaker.PartBuilder;

function registerMaterial(name as string, color as int) as Material {
    return MaterialSystem.getMaterialBuilder().setName(name).setColor(color).build();
}

var tinyDust as Part = MaterialSystem.getPartBuilder().setName("tiny_dust_icr").setPartType(MaterialSystem.getPartType("item")).setOreDictName("tinyDustIcr").build();

static materialList as string[][int] = {
    0x8F8D07 : ["Cesium", "铯"],
    0x8A93A9 : ["Indium", "铟"],
    0xB59AFF : ["Titanium" , "钛"],
    0x88D461 : ["Beryllium", "铍"],
    0x837E77 : ["Germanium", "锗"],
    0x94B4D3 : ["Zirconium", "锆"],
    0x2A2D0C : ["Soldertin", "焊锡"],
    0x888EDF : ["Adamantium", "艾德曼合金"],
    0xADD1CC : ["Stainlesstitanium", "防锈钛"],
    0x6C6C6C : ["Berylliumaluminumalloy", "铍铝合金"]
};

static partList as string[] = ["ingot", "dust", "nugget", "plate", "rod", "gear", "dense_plate", "small_dust", "block"];

for color, name in materialList {
    var material as Material = registerMaterial(name[0], color);
    tinyDust.registerToMaterial(material);
    material.registerParts(partList);
}