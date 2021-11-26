# UE4-ScriptHelpers

Helper scripts for **Unreal Engine 4**.

/!\ Scripts must be put in the project **root folder** (next to **uproject** file).


## I. Clean All

[CleanAll.bat](https://github.com/mrouffet/UE4-ScriptHelpers/blob/main/CleanAll.bat)

Clear all temporary and build files.

- Kill process
	- Kill Unreal Engine
	- Kill Visual Studio
	- Wait for kill

- Clear temporary files
	- Visual Studio
		- .vs
		- .sln
	- Unreal Project
		- Binaries
		- Intermediate
		- Saved (Local Editor settings are **not** deleted)
		- DerivedDataCache
	- Unreal Project's Plugins
		- Binaries
		- Intermediate


## II. Rebuild All

[RebuildAll.bat](https://github.com/mrouffet/UE4-ScriptHelpers/blob/main/RebuildAll.bat)

Full rebuild after Clear.\
/!\ Require **Clean All** script.

- Call Clean All.
- Generate new Visual Studio project files (using Unreal Engine generation script).
	- .vcxproj
	- .sln
- Launch Visual Studio
	- Generate new .vs/
- Build Sources
- Launch Editor
