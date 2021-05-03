#priority 100
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

function registerBlock(name as string) {
    var block as Block = VanillaFactory.createBlock(name, <blockmaterial:iron>);
    block.creativeTab = <creativetab:materials.base>;
    block.register();
}

static registerBlocks as string[string] = {
    "block_nether_star" : "下界之星块",
    "block_titanium_sky" : "镀钛陨石块",
    "block_glass_one" : "光学选矿方块 LV.1",
    "block_glass_two" : "光学选矿方块 LV.2",
    "block_glass_four" : "光学选矿方块 LV.4",
    "block_glass_five" : "光学选矿方块 LV.5",
    "block_glass_three" : "光学选矿方块 LV.3",
    "ore_rutile" : "金红石矿",
    "device_frame" : "设备框架"
};

for block in registerBlocks {
    registerBlock(block);
}

var glass as Block = VanillaFactory.createBlock("glass", <blockmaterial:glass>);
glass.creativeTab = <creativetab:materials.base>;
glass.blockLayer = "CUTOUT";
glass.fullBlock = false;
glass.translucent= true;
glass.register();

var sand as Block = VanillaFactory.createBlock("quartz_sand", <blockmaterial:sand>);
sand.creativeTab = <creativetab:materials.base>;
sand.gravity = true;
sand.register();