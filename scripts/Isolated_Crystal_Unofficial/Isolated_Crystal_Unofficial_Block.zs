#priority 100
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Fluid;

function createBlock(name as string) {
    var block as Block = VanillaFactory.createBlock(name, <blockmaterial:iron>);
    block.creativeTab = <creativetab:materials.base>;
    block.register();
}

static createBlocks as string[string] = {
    "block_titanium" : "钛块",
    "block_zirconium" : "锆块",
    "block_beryllium" : "铍块",
    "block_indium" : "铟块",
    "block_solder_tin" : "焊锡块",
    "block_cesium" : "铯块",
    "block_germanium" : "锗块",
    "block_adamantium" : "艾德曼合金块",
    "block_nether_star" : "下界之星块",
    "block_titanium_sky" : "镀钛陨石块",
    "ore_rutile" : "金红石矿",
    "device_frame" : "设备框架"
};

for block in createBlocks {
    createBlock(block);
}

var glass as Block = VanillaFactory.createBlock("glass", <blockmaterial:glass>);
glass.blockLayer = "CUTOUT";
glass.fullBlock = false;
glass.translucent= true;
glass.creativeTab = <creativetab:materials.base>;
glass.register();

var sand as Block = VanillaFactory.createBlock("quartz_sand", <blockmaterial:sand>);
sand.creativeTab = <creativetab:materials.base>;
sand.gravity = true;
sand.register();