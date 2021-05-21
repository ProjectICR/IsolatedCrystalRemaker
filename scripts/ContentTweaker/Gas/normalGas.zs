#loader mekatweaker
import mods.mekatweaker.GasFactory;
import mods.mekatweaker.Gas;

var TTGas as Gas = GasFactory.createGas("titanium_tetrachloride_gas");
TTGas.setIcon("blocks/gas/titanium_tetrachloride_gas");
TTGas.setNeedFluid(true);
TTGas.setNeedBucket(true);
TTGas.register();

var STGas as Gas = GasFactory.createGas("silicon_tetrachloride_gas");
STGas.setIcon("blocks/gas/silicon_tetrachloride_gas");
STGas.setNeedFluid(true);
STGas.setNeedBucket(true);
STGas.register();