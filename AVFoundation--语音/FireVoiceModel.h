//
//  FireVoiceModel.h
//  AVFoundation--语音
//
//  Created by MrFire  on 2017/9/7.
//  Copyright © 2017年 MrFire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LanguageType) {
    LanguageTypeDefault,//默认（普通话）
    LanguageTypeCH,//中文（普通话）
    LanguageTypeHK,//香港（粤语）
    LanguageTypeTW,//中文（台湾）
    LanguageTypeUS,//英语（美式）
    LanguageTypeEN//英语（英式）
};

@interface FireVoiceModel : NSObject

/**
 要说的句子
 */
@property (nonatomic , copy) NSString *string;

/**
 语言类型
 */
@property (nonatomic, assign) LanguageType languageType;

/**
 说话速率，0~1，默认0.5
 */
@property (nonatomic, assign) CGFloat rate;

/**
 音调，0.5~2.0，默认1.0
 */
@property (nonatomic, assign) CGFloat pinch;

/**
 音量，0~1，默认为1
 */
@property (nonatomic, assign) CGFloat volume;

/**
 说话前的时间，默认为0
 */
@property (nonatomic, assign) NSTimeInterval preDelay;

/**
 说话后的延时时间，默认为0
 */
@property (nonatomic, assign) NSTimeInterval postDelay;

@end
