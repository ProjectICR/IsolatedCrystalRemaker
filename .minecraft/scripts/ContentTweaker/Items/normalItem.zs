#priority 100
#loader contenttweaker
import scripts.grassUtils.CotUtils;


var registerItems as string[] = [
    "puresi",
    "crystalsi",
    "middle_item",
	"glass_fragment",
    "pig_iron_billet"
];

for name in registerItems {
    CotUtils.addNormalItem(name);
}
