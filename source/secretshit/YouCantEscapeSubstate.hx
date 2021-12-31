package secretshit;

import flixel.util.FlxTimer;
import flash.system.System;
import Discord.DiscordClient;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxAxes;
import flixel.text.FlxText;

/*

*/
class YouCantEscapeSubstate extends MusicBeatSubstate {
    var defSize:Float = 401;
    var growSprite:Bool = false;
    var hand:FlxSprite = new FlxSprite().loadGraphic(Paths.image('handlmao'));

    function startCutscene() {
        hand.screenCenter();
        FlxG.sound.music.stop();
        FlxG.sound.cache(Paths.sound('sus_LOUD'));
        
        var tmr = new FlxTimer().start(3, function(tmr:FlxTimer) {
            FlxG.sound.play(Paths.sound('sus_LOUD'));
            add(hand);
            growSprite = true;
            var tmr = new FlxTimer().start(1.6, function(tmr:FlxTimer) {
                growSprite = false;
                System.exit(0);
                // var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
                // bg.scrollFactor.set();
                // add(bg);
                // var txt = new FlxText(0, 0, "loading video!", 64);
                // txt.screenCenter();
                // add(txt);

                // (new FlxVideo(Paths.video('stickbugged'))).finishCallback = function() {
                //     close();
                //     remove(txt);
                //     remove(bg);
                //     remove(hand);
                //     MusicBeatState.switchState(new MainMenuState());
                // }
            });
        });
    }


    override function create() {
        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, new FlxColor(0x99000000));
        add(bg);
        var texts:Array<FlxText> = [
            new FlxText(0, FlxG.height / 2 - 60, "YOU CAN'T ESCAPE THE NOKY"),
            new FlxText(0, FlxG.height / 2 + 60, "(start running NOW)")
        ];

        // add text in bulk to reduce code repeating
        for (index => value in texts.keyValueIterator()) {
            value.setFormat(Paths.font("Pangolin-Regular.ttf"), 72, FlxColor.RED, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            value.screenCenter(FlxAxes.X);
            add(value);
        }

        startCutscene();
    }

    override function update(elapsed:Float)
    {
        /*
        ! saving for future ref, commenting out for a cutscene that plays in this substate
        // if (FlxG.keys.anyJustPressed([ESCAPE]))
        // {
        //     close();
        // }
        */
        if (growSprite) {
            defSize += 4250 * elapsed;
            hand.setGraphicSize(Std.int(defSize));
        }
        
        super.update(elapsed);
    }
}