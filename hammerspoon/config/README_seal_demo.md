# Seal.plugins.apps Demo

This demo showcases the powerful Seal spoon with the `apps` plugin for Hammerspoon, creating a Spotlight-like application launcher with enhanced functionality.

## What is Seal?

Seal is a pluggable launch bar for Hammerspoon that provides:
- Fast application launching via Spotlight integration
- Calculator functionality
- Screenshot capabilities  
- Custom user-defined actions
- Extensible plugin system

## Features Demonstrated

### 1. Apps Plugin (`Seal.plugins.apps`)
- **Application Launching**: Type app names to launch them instantly
- **Custom Search Paths**: Configure where to look for applications
- **Spotlight Integration**: Uses macOS Spotlight for fast app discovery
- **Programmatic Control**: Restart and configure the plugin dynamically

### 2. User Actions Plugin
The demo includes several custom actions:
- **config**: Edit Hammerspoon configuration in Cursor
- **reload**: Reload Hammerspoon configuration
- **activity**: Open Activity Monitor
- **google [query]**: Search Google with your query
- **github**: Open GitHub website
- **sleep**: Put system to sleep
- **lock**: Lock the screen

### 3. Additional Plugins
- **calc**: Simple calculator (try typing `2+2`)
- **screencapture**: Take screenshots

## Usage

### Basic Operations
1. **Open Seal**: Press `Cmd+Space`
2. **Toggle Seal**: Press `Cmd+Alt+Space`
3. **Launch Apps**: Type any application name (e.g., "Safari", "Terminal")
4. **Calculate**: Type math expressions (e.g., "15 * 8")

### Custom Commands
- Type `config` → Opens Hammerspoon config in Cursor
- Type `reload` → Reloads Hammerspoon configuration  
- Type `google hammerspoon` → Searches Google for "hammerspoon"
- Type `sleep` → Puts system to sleep
- Type `lock` → Locks the screen

### Demo Hotkeys
- `Hyper+S` (`Cmd+Alt+Ctrl+Shift+S`) → Show demo information
- `Hyper+R` (`Cmd+Alt+Ctrl+Shift+R`) → Restart apps plugin
- `Hyper+A` (`Cmd+Alt+Ctrl+Shift+A`) → Add custom search path

## Configuration

### Custom Search Paths
The demo configures these search paths for applications:
```lua
s.plugins.apps.appSearchPaths = {
    "/Applications",
    "/Applications/Utilities", 
    "/System/Applications",
    "/System/Applications/Utilities",
    "~/Applications",
    "/usr/local/bin",     -- Command line tools
    "~/bin"               -- Personal scripts
}
```

### Adding More Search Paths
You can add more paths dynamically:
```lua
table.insert(spoon.Seal.plugins.apps.appSearchPaths, "/your/custom/path")
spoon.Seal.plugins.apps:restart()  -- Restart to pick up changes
```

## Integration with Existing Config

To use this demo in your existing Hammerspoon configuration:

1. **Include the apps.lua file**:
   ```lua
   require("src.apps")
   ```

2. **Or copy the configuration** into your existing `init.lua`

3. **Customize hotkeys** if they conflict with your existing setup

## API Reference

### Key Methods
- `spoon.Seal:loadPlugins({"apps", "calc", "useractions"})` → Load plugins
- `spoon.Seal.plugins.apps:restart()` → Restart apps plugin
- `spoon.Seal.plugins.apps:start()` → Start apps plugin  
- `spoon.Seal.plugins.apps:stop()` → Stop apps plugin

### Key Variables
- `spoon.Seal.plugins.apps.appSearchPaths` → Configure search paths
- `spoon.Seal.queryChangedTimerDuration` → Adjust response timing

## Requirements

- **Hammerspoon**: Latest version recommended
- **SpoonInstall**: Automatically loads Seal spoon
- **macOS**: Spotlight integration requires macOS

## Troubleshooting

1. **Seal doesn't appear**: Check if hotkey conflicts with existing apps
2. **Apps not found**: Verify search paths include your app directories
3. **Slow response**: Adjust `queryChangedTimerDuration` value
4. **Plugin issues**: Try restarting the apps plugin with `Hyper+R`

## References

- [Seal Spoon Documentation](https://www.hammerspoon.org/Spoons/Seal.html)
- [Seal.plugins.apps API](https://www.hammerspoon.org/Spoons/Seal.plugins.apps.html)
- [Hammerspoon Documentation](https://www.hammerspoon.org/docs/)
- [SpoonInstall Guide](https://www.hammerspoon.org/Spoons/SpoonInstall.html)

---

**Note**: This demo is designed to work alongside your existing Hammerspoon configuration. The hotkeys and settings can be customized to avoid conflicts. 