//
//  AudioController.m
//  Game
//
//  Created by Robert Tan on 2013-11-23.
//  Adapted from a tutorial:
//  http://www.raywenderlich.com/33808/how-to-make-a-letter-word-game-with-uikit-part-3

#import "AudioController.h"
#import <AVFoundation/AVFoundation.h>

@implementation AudioController
{
    //Audio pointer
    NSMutableDictionary* audio;
}

-(void)preloadAudioEffects:(NSArray*)effectFileNames
{
    //initialize the effects array
    audio = [NSMutableDictionary dictionaryWithCapacity: effectFileNames.count];
    
    //loop over the filenames
    for (NSString* effect in effectFileNames) {
        
        //get the file path URL
        NSString* soundPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: effect];
        NSURL* soundURL = [NSURL fileURLWithPath: soundPath];
        
        //load the file contents
        NSError* loadError = nil;
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error: &loadError];
        NSAssert(loadError==nil, @"load sound failed");
        
        //prepare the playing of the file and limits it to only once
        player.numberOfLoops = 0;
        [player prepareToPlay];
        
        //add to the array ivar
        audio[effect] = player;
    }
}

-(void)playEffect:(NSString*)name
{
    NSAssert(audio[name], @"effect not found");
    
    //Plays the effect, or waits until the file is done playing
    AVAudioPlayer* player = (AVAudioPlayer*)audio[name];
    if (player.isPlaying) {
        player.currentTime = 0;
    } else {
        [player play];
    }
}

@end
