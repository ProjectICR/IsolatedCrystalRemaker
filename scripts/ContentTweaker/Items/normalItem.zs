#priority 100
#loader contenttweaker
import scripts.grassUtils.CotUtils;

var registerItems as string[] = [
    "puresi",
    "crystalsi",
	"glass_fragment"
];

for name in registerItems {
    CotUtils.addNormalItem(name);
}
