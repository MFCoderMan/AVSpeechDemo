//
//  FireVoiceModel.m
//  AVFoundation--语音
//
//  Created by MrFire on 2017/9/7.
//  Copyright © 2017年 MrFire. All rights reserved.
//

#import "FireVoiceModel.h"

@implementation FireVoiceModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configData];
    }
    return self;
}
- (void)configData {
    self.rate = 0.5;
    self.pinch = 1;
    self.volume = 1;
    self.languageType = LanguageTypeDefault;
    self.preDelay = 0;
    self.postDelay = 0;
}
@end
