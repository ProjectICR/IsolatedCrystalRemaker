#priority 10
#loader crafttweaker
import mods.requious.Assembly;
import mods.requious.SlotVisual;
import mods.requious.ComponentFace;


static ft as Assembly = <assembly:fusion_table>;
var itemSlotVisual as SlotVisual = SlotVisual.itemSlot();

ft.setDurationSlot(0, 0).setGroup("time");

ft.setJEIItemSlot(2, 2, "inputL", itemSlotVisual);

ft.setJEIItemSlot(6, 2, "inputR", itemSlotVisual);

ft.setJEIItemSlot(4, 0, "inputU", itemSlotVisual);

ft.setJEIItemSlot(4, 4, "inputD", itemSlotVisual);

ft.setJEIItemSlot(4, 2, "output", SlotVisual.infoSlot());