package secretshit;

import Discord.DiscordClient;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxAxes;
import flixel.text.FlxText;

/*
TODO: fill this shit with something useful once we gather up ideas
*/
class SecretState extends MusicBeatState {

    override function create() {
        #if desktop
		DiscordClient.changePresence("The Noky's Room", null);
		#end
        FlxG.sound.playMusic(Paths.inst('interstate-270-washington-national-pike'), 1, true);
        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, new FlxColor(0xff00aa00));
        add(bg);
        var texts:Array<FlxText> = [
            new FlxText(0, 50, 0, "THE NOKY'S ROOM", 48),
            new FlxText(0, 100, 0, "(you cannot leave)", 48),
            new FlxText(0, FlxG.height / 2, "this is where i do your mom")
        ];

        // add text in bulk to reduce code repeating
        for (index => value in texts.keyValueIterator()) {
            value.setFormat(Paths.font("Pangolin-Regular.ttf"), 48, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            value.screenCenter(FlxAxes.X);
            add(value);
        }
    }

    override function update(elapsed:Float)
    {
        if (FlxG.keys.anyJustPressed([ESCAPE]))
        {
            openSubState(new YouCantEscapeSubstate());
        }
        super.update(elapsed);
    }
}