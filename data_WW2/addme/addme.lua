-- recursively merges the second given table into the first given table
function MergeTables( mission, newFlags )
   --for each table entry,
   local array = type({})
   for key,value in pairs(newFlags) do      
      --check for nested tables
      if type(value) == array then
         --mission must have this key as a table too
         if type(mission[key]) ~= array then
            mission[key] = {}
         end
         --merge these two tables recursively
         MergeTables(mission[key], value)
      else
         --the key is a simple variable, so simply store it
         mission[key] = value
      end
   end
end

--Search through the missionlist to find a map that matches mapName,
--then insert the new flags into said entry.
--Use this when you know the map already exists, but this content patch is just
--adding new gamemodes (otherwise you should just add whole new entries to the missionlist)
function AddNewGameModes(missionList, mapName, newFlags)
   for i, mission in missionList do
      if mission.mapluafile == mapName then
         MergeTables(mission, newFlags)
      end
   end
end

--insert totally new maps here:
local sp_n = 0
local mp_n = 0
sp_n = table.getn(sp_missionselect_listbox_contents)

sp_missionselect_listbox_contents[sp_n+1] = { isModLevel = 0, mapluafile = "WW2%s_%s", era_c = 1, mode_con_c  = 1,}
mp_n = table.getn(mp_missionselect_listbox_contents)
mp_missionselect_listbox_contents[mp_n+1] = sp_missionselect_listbox_contents[sp_n+1]

--add my modes to the singleplayer map selection screen
AddNewGameModes( sp_missionselect_listbox_contents, "WW2%s_%s", {era_g = 1, mode_con_g = 1} )

-- associate this mission name with the current downloadable content directory
-- (this tells the engine which maps are downloaded, so you need to include all new mission lua's here)
-- first arg: mapluafile from above
-- second arg: mission script name
-- third arg: level memory modifier.  the arg to LuaScript.cpp: DEFAULT_MODEL_MEMORY_PLUS(x)

AddDownloadableContent("WW2","WW2g_con",4)

-- all done
newEntry = nil
n = nil

-- Now load our core.lvl into the shell to add our localize keys
ReadDataFile("..\\..\\addon\\WW2\\data\\_LVL_PC\\core.lvl")
ReadDataFile("..\\..\\addon\\WW2\\data\\_LVL_PC\\shell.lvl")
