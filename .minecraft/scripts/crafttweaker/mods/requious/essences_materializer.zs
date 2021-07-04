#loader crafttweaker
import mods.requious.Assembly;
import mods.requious.SlotVisual;
import mods.requious.ComponentFace;


var allFace as ComponentFace = ComponentFace.all();
static em as Assembly = <assembly:essences_materializer>;


em.setDurationSlot(6, 2).setGroup("time").setVisual(SlotVisual.arrowRight());
em.setItemSlot(0, 2, allFace, 64).setGroup("input0").setAccess(true, false);
em.setItemSlot(2, 0, allFace, 64).setGroup("input1").setAccess(true, false);
em.setItemSlot(2, 4, allFace, 64).setGroup("input2").setAccess(true, false);
em.setItemSlot(4, 2, allFace, 64).setGroup("input3").setAccess(true, false);
em.setFluidSlot(8, 4, allFace, 1000).setGroup("output").allowBucket(false, true).setAccess(false, true).pushFluid(100);
em.setItemSlot(8, 2, allFace, 64).setGroup("output").setHandAccess(false, true).setAccess(false, true).pushItem(1);

em.setJEIItemSlot(0, 2, "input0");
em.setJEIItemSlot(2, 0, "input1");
em.setJEIItemSlot(2, 4, "input2");
em.setJEIItemSlot(4, 2, "input3");
em.setJEIItemSlot(8, 2, "output");
em.setJEIFluidSlot(8, 4, "output");
em.setJEIDurationSlot(6, 2, "time", SlotVisual.arrowRight());