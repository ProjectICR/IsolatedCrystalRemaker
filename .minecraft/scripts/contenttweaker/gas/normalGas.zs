#priority 100
#loader mekatweaker
import mods.mekatweaker.GasFactory;
import mods.mekatweaker.Gas;

function addGas(name as string, path as string, needFluid as bool, needBucket as bool) {
    var gas as Gas = GasFactory.createGas(name);
    gas.setIcon(path);
    gas.setNeedFluid(needFluid);
    gas.setNeedBucket(needBucket);
    gas.register();
}


var gasName as string[] = [
    "titanium_tetrachloride_gas",
    "silicon_tetrachloride_gas",
    "carbon_monoxide_gas"
];


for gas in gasName {
    addGas(gas, ("blocks/gas/" ~ gas), true, true);
}