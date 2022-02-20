#priority 100
#loader mekatweaker
import mods.mekatweaker.GasFactory;
import mods.mekatweaker.Gas;

function addGas(name as string) {
    var gas as Gas = GasFactory.createGas(name);
    gas.setIcon("blocks/gas/" ~ name);
    gas.setNeedFluid(true);
    gas.setNeedBucket(true);
    gas.register();
}


var gasName as string[] = [
    "titanium_tetrachloride_gas",
    "silicon_tetrachloride_gas",
    "carbon_monoxide_gas"
];


for gas in gasName {
    addGas(gas);
}