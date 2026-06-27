# Apple Library
UI Library in the style of Apple's MacOS and iPadOS.
**Now updated with Mobile Touch Support, Theme Customization, and an Apple UI Toggle Button!**

## Software requirements
Requires a modern Roblox executor supporting `gethui()` or standard access to `game.CoreGui`.

## How to use?
- Load the UI Library from the GitHub repository.
```lua
local AppleUi = loadstring(game:HttpGet("[https://raw.githubusercontent.com/J0se-j/AppleLibrary/refs/heads/main/main.lua](https://raw.githubusercontent.com/J0se-j/AppleLibrary/refs/heads/main/main.lua)"))()
```
- Create a window.
```lua
local window = AppleUi:init("Titlebar", true, Enum.KeyCode.RightShift, true, "purple")
```
- Now you can add menus, elements, dividers, etc.
- A [template](/example.lua) is given if you want to see how elements, menus, etc are done.

# Apple Library: Documentation
## Creating window
- Window: It holds everything except temporary notifications.
```lua
local window = AppleUi:init(titleText: string, splash: boolean, showHideKeybind: KeyCode, deletePreviousUI: boolean, theme: string)
```
*Note: For the `theme` parameter, you can pass `"blue"`, `"purple"`, or `"red"` to change the primary accent color of the UI.*

## Notifications
- Temporary Notification: Appears on top-right corner. Has no buttons but has one icon. Deletes after few seconds.
```lua
window:TempNotify(titleText: string, paragraphText: string, icon: string)
```
- Notification 1: Has one button and one icon. Appears over window.
```lua
window:Notify(titleText: string, paragraphText: string, button1Text: string, icon: string)
```
- Notification 2: Has two buttons and one icon. Appears over window.
```lua
window:Notify2(titleText: string, paragraphText: string, button1Text: string, button2Text: string, icon: string)
```

## Sidebar menus and dividers
- Section Divider: Simple text label to divide sections in sidebar.
```lua
 window:Divider(text: string)
```
- Section: Contains many elements. Returns a table so make sure this is a variable.
```lua
local section = window:Section(text: string)
```

## Section elements
- Divider: Similar to Section Divider.
```lua
section:Divider(text: string)
```
- Label: Texts you can use for notes or further information.
```lua
section:Label(text: string)
```
- Button: Executes callback when clicked.
```lua
section:Button(text: string, callback: function)
```
- Switch: Toggle switch that executes callback with boolean parameter.
```lua
section:Switch(text: string, defaultMode: boolean, callback: function)
```
- Text Field: Textbox which executes callback when it loses focus.
```lua
section:TextField(text: string, placeholderText: string, callback: function)
```

## Miscellaneous
- Toggle Visibility: Hides/Shows window. (Mobile users can also tap the draggable 🍎 button!)
```lua
window:ToggleVisible()
```
- Green Button: Sets the callback of the green traffic light button.
```lua
window:GreenButton(callback: function)
```

# Apple Library: Images

![image](https://user-images.githubusercontent.com/82454201/221863896-c92c454a-00a4-4943-9714-532e12d50ee5.png)
### Window
![image](https://user-images.githubusercontent.com/82454201/221863995-7f86524a-c4ea-4123-8978-d57a99421b7c.png)
### Splash
![image](https://user-images.githubusercontent.com/82454201/221864179-56a4b5d6-df49-4f52-b1bb-ad3465a0e4f2.png)
### Temporary Notification
![image](https://user-images.githubusercontent.com/82454201/221864518-4215a85c-e1cb-4a05-a1c0-730a61a73e57.png)
### Notification 1
![image](https://user-images.githubusercontent.com/82454201/221864617-41d6443e-6623-487b-87c0-7502ff1a4ab4.png)
### Notification 2

