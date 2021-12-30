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
! a placeholder for now, if you wanna test this out press 6 on your keyboard in the main menu
* this is supposed to be a thing that you unlock somewhere in the game (haven't decided yet)

TODO: find a use for this state
*/
class UnlockedState extends MusicBeatState {
    override function create() {
        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLUE);
        add(bg);
        var texts:Array<FlxText> = [
            new FlxText(0, FlxG.height / 2 - 50, 0, "ayo", 48),
            new FlxText(0, FlxG.height / 2 + 50, 0, "you found the noky's room", 48)
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
        if (FlxG.keys.anyJustPressed([ENTER]))
        {
            MusicBeatState.switchState(new SecretState());
        }
        super.update(elapsed);
    }
}