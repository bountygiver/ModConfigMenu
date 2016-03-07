class MCM_OptionsMenuListener extends UIScreenListener config(ModConfigMenu);

var config bool ENABLE_MENU;
var config bool USE_FLAT_DISPLAY_STYLE;

var localized string m_strModMenuButton;

var UIOptionsPCScreen ParentScreen;
var UIButton ModOptionsButton;

event OnInit(UIScreen Screen)
{
    `log("MCM Listener OnInit");

    ParentScreen = UIOptionsPCScreen(Screen);

    if (ENABLE_MENU)
    {
        InjectModOptionsButton();
    }
}

event OnReceiveFocus(UIScreen Screen)
{
    `log("MCM Listener OnReceiveFocus");
}

event OnLoseFocus(UIScreen Screen)
{
}

event OnRemoved(UIScreen Screen)
{
}

simulated function InjectModOptionsButton()
{
    //UIList ButtonList = ParentScreen.List;
    //ListItem = ParentScreen.Spawn( class'UIMechaListItem', ButtonList.itemContainer );
	//ListItem.bAnimateOnInit = false;
	//ListItem.InitListItem();
	//ListItem.SetY(i * class'UIMechaListItem'.default.Height);
    ModOptionsButton = ParentScreen.Spawn(class'UIButton', ParentScreen);
	ModOptionsButton.InitButton(, m_strModMenuButton, ShowModOptionsDialog);
	ModOptionsButton.SetPosition(500, 850); //Relative to this screen panel
    ModOptionsButton.AnimateIn(0);
}

simulated function ShowModOptionsDialog(UIButton kButton)
{
    local UIMovie TargetMovie;

    `log("Mod Options Dialog Called.");
    
	//TargetMovie = XComShellPresentationLayer(ParentScreen.Owner) == none ? ParentScreen.Owner.Get2DMovie() : ParentScreen.Owner.Get3DMovie();
	if (USE_FLAT_DISPLAY_STYLE)
		TargetMovie = None;
	else
	    TargetMovie = ParentScreen.Movie;

    MCM_OptionsScreen(ParentScreen.Movie.Stack.Push(ParentScreen.Spawn(class'MCM_OptionsScreen', ParentScreen), TargetMovie)).InitModOptionsMenu(self);
}

defaultproperties
{
    //ScreenClass = class'UIOptionsPCScreen';
    ScreenClass = class'UIOptionsPCScreen';
}