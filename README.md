# UE4-ScriptHelpers

Helper scripts for Unreal Engine 4.

/!\ Scripts must be put in the project root folder (next to **uproject** file).


## I. Clean All

Clear all temporary files.

- Kill process
	- Kill Unreal Engine
	- Kill Visual Studio
	- Wait for kill

- Clear temporary files
	- Visual Studio
	- Unreal Project
	- Unreal Project's Plugins

\* Local Editor settings are **saved**.


## II. Rebuild All

Full rebuild after Clear.\
/!\ Require **Clean All** script.

- Call Clean All.
- Generate new Visual Studio project files
- Launch Visual Studio
- Build Sources
- Launch Editor
