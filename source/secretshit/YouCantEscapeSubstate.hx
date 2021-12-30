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
class YouCantEscapeSubstate extends MusicBeatSubstate {

    override function create() {
        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, new FlxColor(0x99000000));
        add(bg);
        var texts:Array<FlxText> = [
            new FlxText(0, FlxG.height / 2, "YOU CAN'T ESCAPE THE NOKY")
        ];

        // add text in bulk to reduce code repeating
        for (index => value in texts.keyValueIterator()) {
            value.setFormat(Paths.font("Pangolin-Regular.ttf"), 72, FlxColor.RED, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            value.screenCenter(FlxAxes.X);
            add(value);
        }
    }

    override function update(elapsed:Float)
    {
        if (FlxG.keys.anyJustPressed([ESCAPE]))
        {
            close();
        }
        super.update(elapsed);
    }
}