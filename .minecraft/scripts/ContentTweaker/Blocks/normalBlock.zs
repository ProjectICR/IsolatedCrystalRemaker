#priority 100
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

var glass as Block = VanillaFactory.createBlock("glass", <blockmaterial:glass>);
glass.creativeTab = <creativetab:materials.base>;
glass.blockSoundType = <soundtype:Glass>;
glass.blockLayer = "CUTOUT";
glass.fullBlock = false;
glass.translucent= true;
glass.register();

var sand as Block = VanillaFactory.createBlock("quartz_sand", <blockmaterial:sand>);
sand.creativeTab = <creativetab:materials.base>;
sand.blockSoundType = <soundtype:sand>;
sand.gravity = true;
sand.register();

var dLeaves as Block = VanillaFactory.createBlock("dead_leaves", <blockmaterial:leaves>);
dLeaves.creativeTab = <creativetab:materials.base>;
dLeaves.blockSoundType = <soundtype:plant>;
dLeaves.blockLayer = "TRANSLUCENT";
dLeaves.fullBlock = false;
dLeaves.translucent= true;
dLeaves.register();