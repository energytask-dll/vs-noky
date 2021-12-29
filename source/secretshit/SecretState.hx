package secretshit;

import flixel.FlxSprite;
import CoolUtil;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxAxes;
import flixel.FlxState;
import flixel.text.FlxText;
import Alphabet;

/*
TODO: fill this shit with something useful once we gather up ideas
*/
class SecretState extends MusicBeatState {
    override function create() {
        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.RED);
        add(bg);
        var texts:Array<FlxText> = [
            new FlxText(0, FlxG.height / 2 - 50, 0, "placeholder", 48),
            new FlxText(0, FlxG.height / 2 + 50, 0, "(esc to go back to the main menu)", 48)
        ];

        // add text in bulk to reduce code repeating
        for (index => value in texts.keyValueIterator()) {
            value.setFormat("VCR OSD Mono", 48, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            value.screenCenter(FlxAxes.X);
            add(value);
        }
    }

    override function update(elapsed:Float)
    {
        if (FlxG.keys.anyJustPressed([ESCAPE]))
        {
            MusicBeatState.switchState(new MainMenuState());
        }
        super.update(elapsed);
    }
}