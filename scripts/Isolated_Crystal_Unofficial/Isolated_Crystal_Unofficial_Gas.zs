#loader mekatweaker
import mods.mekatweaker.GasFactory;
import mods.mekatweaker.Gas;

var titaniumTetrachlorideGas as Gas = GasFactory.createGas("titanium_tetrachloride_gas");
titaniumTetrachlorideGas.setIcon("blocks/gas/titanium_tetrachloride_gas");
titaniumTetrachlorideGas.setNeedFluid(true);
titaniumTetrachlorideGas.setNeedBucket(true);
titaniumTetrachlorideGas.register();

var siliconTetrachlorideGas as Gas = GasFactory.createGas("silicon_tetrachloride_gas");
siliconTetrachlorideGas.setIcon("blocks/gas/silicon_tetrachloride_gas");
siliconTetrachlorideGas.setNeedFluid(true);
siliconTetrachlorideGas.setNeedBucket(true);
siliconTetrachlorideGas.register();