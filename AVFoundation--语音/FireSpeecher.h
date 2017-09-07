//
//  FireSpeecher.h
//  AVFoundation--语音
//
//  Created by MrFire on 2017/9/7.
//  Copyright © 2017年 MrFire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FireVoiceModel.h"

typedef NS_ENUM(NSInteger, PauseType) {
    PauseTypeImmediate,//立刻停止
    PauseTypeByWord//读完本字（单词）后再停止
};

@interface FireSpeecher : NSObject

/**
 暂停或者停止类型
 */
@property (nonatomic, assign) PauseType pauseType;

/**
 初始化

 @param models 需要转化的文字Model
 @return FireSpeecher对象
 */
- (instancetype)initWithModels:(NSArray <FireVoiceModel *>*)models;

/**
播放

 @return YES-->播放成功，NO-->播放失败
 */
- (BOOL)speech;

/**
 暂停播放
 
 @return YES-->暂停成功，NO-->暂停失败
 */
- (BOOL)pausedSpeech;

/**
 停止
 
 @return YES-->停止成功，NO-->停止失败
 */
- (BOOL)stopeSpeech;
/**
 继续播放
 
 @return YES-->继续播放成功，NO-->继续播放失败
 */
- (BOOL)contiueSpeech;
@end
