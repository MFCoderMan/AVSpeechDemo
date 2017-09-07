//
//  FireSpeecher.m
//  AVFoundation--语音
//
//  Created by MrFire on 2017/9/7.
//  Copyright © 2017年 MrFire. All rights reserved.
//

#import "FireSpeecher.h"
#import <AVFoundation/AVFoundation.h>

@interface FireSpeecher ()<AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@end

@implementation FireSpeecher

- (instancetype)initWithModels:(NSArray<FireVoiceModel *> *)models {
    self = [super init];
    if (self) {
        [self configData];
        [self configWithModels:models];
    }
    return self;
}
#pragma mark -   设置默认值
- (void)configData {
    self.pauseType = PauseTypeImmediate;
}
- (void)configWithModels:(NSArray <FireVoiceModel *> *)models {
    [models enumerateObjectsUsingBlock:^(FireVoiceModel * _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:[self voiceLanguageFromType:model.languageType]];
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:model.string];
        utterance.rate = model.rate;
        utterance.pitchMultiplier = model.pinch;
        utterance.volume = model.volume;
        utterance.preUtteranceDelay = model.preDelay;
        utterance.postUtteranceDelay = model.postDelay;
        utterance.voice = voice;
        [self.synthesizer speakUtterance:utterance];
        //先暂停
        [self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }];
}
#pragma mark -   lazyLoad
- (AVSpeechSynthesizer *)synthesizer {
    if (!_synthesizer) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        _synthesizer.delegate = self;
    }
    return _synthesizer;
}
- (BOOL)speech {
    return  [self contiueSpeech];
}
- (BOOL)pausedSpeech {
    return  [self.synthesizer pauseSpeakingAtBoundary:[self boundaryFromPauseType:self.pauseType]];
}
- (BOOL)stopeSpeech {
    return [self.synthesizer stopSpeakingAtBoundary:[self boundaryFromPauseType:self.pauseType]];
}

- (BOOL)contiueSpeech {
    return  [self.synthesizer continueSpeaking];
}
#pragma mark -   AVSpeechSynthesizerDelegate
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"开始：%@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"暂停：%@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"取消：%@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {
    NSLog(@"将要开始：%@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"继续：%@",utterance.speechString);
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"完成：%@",utterance.speechString);
}
#pragma mark -   转化
- (AVSpeechBoundary)boundaryFromPauseType:(PauseType)pauseType {
    if (pauseType == PauseTypeImmediate) {
        return AVSpeechBoundaryImmediate;
    }else if (pauseType == PauseTypeByWord) {
        return AVSpeechBoundaryWord;
    }
    return AVSpeechBoundaryImmediate;
}
- (NSString *)voiceLanguageFromType:(LanguageType )type {
    switch (type) {
        case LanguageTypeDefault: case LanguageTypeCH: {
            return @"zh-CN";
        }
            break;
        case LanguageTypeTW:{
            return @"zh-TW";
        }
            break;
        case LanguageTypeHK: {
            return @"zh-HK";
        }
            break;
        case LanguageTypeEN: {
            return @"en-GB";
        }
            break;
        case LanguageTypeUS:{
            return @"en-US";
        }
            break;
        default:
            return nil;
            break;
    }
}
@end
