//
//  ViewController.m
//  AVFoundation--语音
//
//  Created by MrFire on 2017/9/6.
//  Copyright © 2017年 MrFire. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "FireSpeecher.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 80)];
    [button setTitle:@"开始表演" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.center = self.view.center;
}
- (void)buttonClick {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    NSArray *strings = @[@"二货，请开始你的表演",
                                 @"我有一只小毛驴，我从来也不骑，有一天我心血来潮骑着去赶集",
                                 @"然后呢",
                                 @"我手里拿着小皮鞭，我心里正得意，不知怎么哗啦啦我摔了一身泥",
                                 @"哈哈哈哈，笑死我啦"];
    [strings enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL * _Nonnull stop) {
        FireVoiceModel *model = [[FireVoiceModel alloc] init];
        model.string = string;
        model.postDelay = 0.3;
        if (idx%2 == 0) {
            model.pinch = 1.5;
        }
        [array addObject:model];
    }];
    FireSpeecher *speecher = [[FireSpeecher alloc] initWithModels:array];
    if ([speecher speech]) {
        NSLog(@"开讲啦");
    }else {
        NSLog(@"出错啦");
    }
}



//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    //获得所有的
//    NSArray *voices =  [AVSpeechSynthesisVoice speechVoices];
//    [voices enumerateObjectsUsingBlock:^(AVSpeechSynthesisVoice *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@",obj.language);
//    }];
//    NSLog(@"%@",AVSpeechSynthesisVoice.currentLanguageCode);//默认: en-US
//    /*
//     en-GB
//     en-US
//     zh-CN
//     zh-HK
//     zh-TW
//     */
//    
//    // 创建嗓音，指定嗓音不存在则返回nil
//    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-TW"];
//
//    // 创建语音合成器
//    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
//    
//    // 实例化发声的对象
//    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"我有一只小毛驴，我从来也不骑，有一天我心血来潮骑着去赶集"];
//    utterance.voice = voice;//语言
//    utterance.rate = 0.5;//语速
//    utterance.volume = 1;//声音
//    utterance.pitchMultiplier = 1;//音调
////    utterance.preUtteranceDelay = 3;//播放前的延时
//    utterance.postUtteranceDelay = 1;//播放后的延时，用于设置连续播放多段文字的间隔
//    
//    // 朗读的内容
//    [synthesizer speakUtterance:utterance];
//    
//    
//    
//    
//    AVSpeechSynthesisVoice *voice2 = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-HK"];
//    // 实例化发声的对象
//    AVSpeechUtterance *utterance2 = [AVSpeechUtterance speechUtteranceWithString:@"我手里拿着小皮鞭我心里正得意，不知怎么哗啦啦我摔了一身泥！"];
//    utterance2.voice = voice2;//语言
//    utterance2.rate = 0.5;//语速
//    utterance2.volume = 1;//声音
//    utterance2.pitchMultiplier = 1;//音调
////    utterance2.preUtteranceDelay = 3;//播放前的延时
//    utterance2.postUtteranceDelay = 2;//播放后的延时，用于设置连续播放多段文字的间隔
//    [synthesizer speakUtterance:utterance2];
//    
//    
//    
//}

@end
