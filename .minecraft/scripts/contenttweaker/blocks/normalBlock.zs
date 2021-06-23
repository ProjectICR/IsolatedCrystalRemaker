#priority 100
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;


var glass as Block = VanillaFactory.createBlock("glass", <blockmaterial:glass>);
glass.creativeTab = <creativetab:materials.base>;
glass.blockSoundType = <soundtype:glass>;
glass.blockLayer = "CUTOUT";
glass.blockHardness = 0.3;
glass.fullBlock = false;
glass.translucent= true;
glass.toolClass = null;
glass.toolLevel = -1;
glass.register();


var dLeaves as Block = VanillaFactory.createBlock("dead_leaves", <blockmaterial:leaves>);
dLeaves.creativeTab = <creativetab:materials.base>;
dLeaves.blockSoundType = <soundtype:plant>;
dLeaves.blockLayer = "TRANSLUCENT";
dLeaves.blockHardness = 0.2;
dLeaves.fullBlock = false;
dLeaves.translucent= true;
dLeaves.toolClass = null;
dLeaves.toolLevel = -1;
dLeaves.register();


var sand as Block = VanillaFactory.createBlock("quartz_sand", <blockmaterial:sand>);
sand.creativeTab = <creativetab:materials.base>;
sand.blockSoundType = <soundtype:sand>;
sand.toolClass = "shovel";
sand.blockHardness = 0.5;
sand.toolLevel = -1;
sand.gravity = true;
sand.register();