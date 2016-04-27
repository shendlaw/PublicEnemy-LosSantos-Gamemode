/*

					THIS FILTERSCRIPT WAS MADE BY SHENDLAW
					FOR www.sa-mp.com

*/

//Main FS Include
#include <a_samp>

//Textdraw
new Text:AnnouncesTD;

//Announces, edit 3 number in AnnounceMessages[3] like you want to put 10 announces set from 3 to 10 etc..
new AnnounceMessage[3][] = {
"~r~Visit ~y~www.sa-mp.com",
"~r~Server IP: ~y~37.187.96.190:50322",
"~r~Tutorial by ~y~shendlaw"
};

//Forwards with timer for show and hide the messages, to define when display them and when hide them for display another text.
forward ShowAnnounceTD(playerid);
forward HideAnnounceMessage(playerid);

//Hide when a player selecting class(it looks ugly with the textdraw showing up when you select class)
public OnPlayerRequestClass(playerid)
{
    TextDrawHideForPlayer(playerid, AnnouncesTD);
    return 1;
}

//Hide the textdraw when player disconnect
public OnPlayerDisconnect(playerid, reason)
{
    TextDrawHideForPlayer(playerid, AnnouncesTD);
    return 1;
}

public OnPlayerSpawn(playerid)
{
    TextDrawShowForPlayer(playerid, AnnouncesTD);
    return 1;
}

//Here you got the textdraw, if you want you can change the position, font, color etc..
public ShowAnnounceTD(playerid)
{
        new RandomMessage = random(sizeof(AnnounceMessage));
        AnnouncesTD = TextDrawCreate(250.000000, 406.000000, AnnounceMessage[RandomMessage]);
        TextDrawBackgroundColor(AnnouncesTD, 85);
        TextDrawFont(AnnouncesTD, 1);
        TextDrawLetterSize(AnnouncesTD, 0.194999, 1.149999);
        TextDrawColor(AnnouncesTD, -1);
        TextDrawSetOutline(AnnouncesTD, 1);
        TextDrawSetProportional(AnnouncesTD, 1);

        TextDrawShowForPlayer(playerid,AnnouncesTD);

        SetTimer("HideAnnounceMessage", 9000, false); //Every 9000ms the textdraw will be hidden, after 9000ms it will be again ready to be displayed.
}

public HideAnnounceMessage(playerid)
{
        TextDrawHideForPlayer(playerid,AnnouncesTD);
}
