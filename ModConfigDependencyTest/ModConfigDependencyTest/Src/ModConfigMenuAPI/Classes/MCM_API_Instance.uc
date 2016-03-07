interface MCM_API_Instance;

delegate CustomSettingsPageCallback(UIScreen ParentScreen, int PageID);
// Gives you a way to roll your own settings to be spawned via the shared menu. 
// You'll have to push a screen to the stack yourself.
// This gives you a way to just hook in your own rolled settings page.
function NewCustomSettingsPage(string TabLabel, delegate<CustomSettingsPageCallback> Handler);

// This lets you take advantage of ready-made UI components.
// TabLabel is what the tab on the left should say.
function MCM_API_SettingsPage NewSettingsPage(string TabLabel);