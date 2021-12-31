package;

import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.util.FlxAxes;
import flixel.text.FlxText;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;

class YelpState extends MusicBeatState
{
	var yStamp = 10;
	var shit:FlxText;
	var shits = new Array<FlxText>();
	var curPage:Int = 1;
	var shit2:FlxText;
	var piss = [
		'10/10: rating my own mod is totally #swag - tech',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]'	
	];
	var piss2 = [
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]'	
	];
	var piss3 = [
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]'	
	];
	var piss4 = [
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]',
		'[free review spot]'	
	];
	function clearShits() {
		if (shits.length > 0) {
			for (i in 0...shits.length) {
				remove(shits[i]);
			}
			for (i in 0...shits.length) {
				shits.pop();
			}
			yStamp = 10;
		}
	}

	function reloadShits(arrayoftext:Array<String>) {
		clearShits();
		for (i in 0...arrayoftext.length)
		{
			shit = new FlxText(0, yStamp, 0, arrayoftext[i], 32);
			shit.setFormat(Paths.font("Pangolin-Regular.ttf"), 32, (arrayoftext[i] == "[free review spot]") ? FlxColor.ORANGE : FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			shit.screenCenter(FlxAxes.X);
			shits.push(shit);
			add(shit);
			yStamp += 40;
		}
		remove(shit2);
		if (curPage > 1 && curPage < 4) {
			shit2 = new FlxText(0, FlxG.height - 50, 0, "< " + curPage + "/4 >", 32);
			
		} else if (curPage > 1) {
			shit2 = new FlxText(0, FlxG.height - 50, 0, "< " + curPage + "/4", 32);
		} else {
			shit2 = new FlxText(0, FlxG.height - 50, 0, curPage + "/4 >", 32);
		}
		shit2.setFormat(Paths.font("Pangolin-Regular.ttf"), 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		shit2.screenCenter(FlxAxes.X);
		add(shit2);
	}

	function reloadHandle() {
		switch (curPage) {
			case 1:
				reloadShits(piss);
			case 2:
				reloadShits(piss2);
			case 3:
				reloadShits(piss3);
			case 4:
				reloadShits(piss3);
		}
	}

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		var bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		reloadHandle();

		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if (FlxG.keys.anyJustPressed([LEFT]))
		{
			if (curPage > 1) {
				FlxG.sound.play(Paths.sound('scrollMenu'));
				curPage -= 1;
			}
			reloadHandle();
		}

		if (FlxG.keys.anyJustPressed([RIGHT]))
		{
			if (curPage < 4) {
				FlxG.sound.play(Paths.sound('scrollMenu'));
				curPage += 1;
			}
			reloadHandle();
		}

		super.update(elapsed);
	}
}