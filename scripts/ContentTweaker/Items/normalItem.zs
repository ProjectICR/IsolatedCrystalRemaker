#priority 100
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

function registerItem(name as string) {
    var item as Item = VanillaFactory.createItem(name);
    item.creativeTab = <creativetab:materials.base>;
    item.register();
}

static registerItems as string[] = [
    "puresi",
    "crystalsi",
	"glass_fragment"
];

for item in registerItems {
    registerItem(item);
}
