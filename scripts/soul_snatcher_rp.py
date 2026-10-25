from file_utils import path_relative_to_file, relative_file_exists
import json

WATER_MOBS = [
  "cod",
  "salmon",
  "glow_squid",
  "squid",
  "dolphin",
  "nautilus",
  "zombie_nautilus"
]

class Mob:
  mobname: str
  namespaced_mob: str
  
  def __init__(self, mobname: str):
    self.mobname = mobname
    self.namespaced_mob = f"minecraft:{mobname}"
  
  def to_item_model_definition(self):
    return {
      "when": self.namespaced_mob,
      "model": {
        "type": "minecraft:model",
        "model": f"vp:item/soul_snatcher_snatched/{self.mobname}"
      }
    }
    
  def to_plain_item_model(self):
    textures = [
      f"vp:item/soul_snatcher_snatched/{self.mobname}",
      "vp:item/soul_snatcher",
    ]
    
    if self.mobname in WATER_MOBS:
      textures.insert(0, "vp:item/soul_snatcher_water")
    
    return {
      "parent": "minecraft:item/generated",
      "textures": {f"layer{index}": texture for index, texture in enumerate(textures)},
      "display": {
        "head": {
          "rotation": [ 0, 180, 0 ],
          "translation": [ 0, 14, 7 ],
          "scale": [ 1, 1, 1]
        },
        "thirdperson_righthand": {
          "rotation": [ 0, 0, 0 ],
          "translation": [ 0, 4.125, 1 ],
          "scale": [ 0.55, 0.55, 0.55 ]
        },
        "firstperson_righthand": {
          "rotation": [ 0, -45, 10 ],
          "translation": [ 0, 5, 1 ],
          "scale": [ 0.4, 0.4, 0.4 ]
        }
      }
    }
    
allowed_mobs: list[str]

with open(path_relative_to_file("../datapack/data/vp/tags/entity_type/soul_snatcher_allowed.json"), "r") as f:
  allowed_mobs = json.load(f)["values"]
  
mobs: list[Mob] = []
texture_status: list[tuple[str, bool]] = []
is_complete: bool = True

for namespaced_mob in allowed_mobs:
  mob_name = namespaced_mob.replace("minecraft:", "", 1)
  mobs.append(Mob(mob_name))
  texture_exists = relative_file_exists(f"../resourcepack/assets/vp/textures/item/soul_snatcher_snatched/{mob_name}.png")
  texture_status.append((mob_name, texture_exists))
  if not texture_exists:
    is_complete = False
  
with open(path_relative_to_file("../resourcepack/assets/vp/items/soul_snatcher_snatched.json"), "w") as f:
  item = {
    "model": {
      "type": "minecraft:select",
      "property": "minecraft:custom_model_data",
      "cases": [mob.to_item_model_definition() for mob in mobs]
    }
  }
  
  json.dump(item, f, indent=2)

for mob in mobs:
  data = mob.to_plain_item_model()
  with open(path_relative_to_file(f"../resourcepack/assets/vp/models/item/soul_snatcher_snatched/{mob.mobname}.json"), "w") as f:
    json.dump(data, f, indent=2)
    
with open(path_relative_to_file("./textures_list.md"), "w") as f:
  data = ("# No missing textures\n" if is_complete else "# Missing textures\n") + "\n".join([f"- [{'x' if status[1] else ' '}] {status[0]}" for status in texture_status])

  f.write(data)