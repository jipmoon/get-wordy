//
//  AudioController.h
//  Game
//
//  Created by Robert Tan on 2013-11-23.
//  Adapted from a tutorial:
//  http://www.raywenderlich.com/33808/how-to-make-a-letter-word-game-with-uikit-part-3
//
//  Description: This class manages the sound effects of the game.
//
//  Functions:  (void) playEffect - Plays the audio file that we preloaded
//              (void)preloadAudioEffects - Loads all the audio files that we want for our game
//
//  Bugs: None



#import <Foundation/Foundation.h>

@interface AudioController : NSObject

-(void)playEffect:(NSString*)name;
-(void)preloadAudioEffects:(NSArray*)effectFileNames;

@end
