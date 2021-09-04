#priority 5
#loader crafttweaker
import mods.requious.AssemblyRecipe;

import scripts.crafttweaker.util.RequiousUtils;
import scripts.crafttweaker.mods.requious.essencesFusion.essencesFusion.ef;


var victus as AssemblyRecipe = AssemblyRecipe.create(function(container) {
    container.addItemOutput("output", RequiousUtils.getCrystal("victus"));
}).requireItem("inputL", RequiousUtils.getCrystal("aqua"))
.requireItem("inputR", RequiousUtils.getCrystal("terra"))
.requireDuration("timeL", 50)
.requireDuration("timeR", 50);


RequiousUtils.addRecipe(ef, [victus], true);