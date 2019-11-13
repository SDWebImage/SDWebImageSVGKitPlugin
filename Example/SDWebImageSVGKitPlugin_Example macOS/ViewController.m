//
//  ViewController.m
//  SDWebImageSVGKitPlugin_Example macOS
//
//  Created by 李卓立 on 2019/11/13.
//  Copyright © 2019 lizhuoli1126@126.com. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImageSVGKitPlugin/SDWebImageSVGKitPlugin.h>
#import <SVGKit/SVGKit.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    SDImageSVGKCoder *SVGCoder = [SDImageSVGKCoder sharedCoder];
    [[SDImageCodersManager sharedManager] addCoder:SVGCoder];
    NSURL *SVGURL = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/1/14/Mahuri.svg"];
    NSURL *SVGURL2 = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/6/67/Firefox_Logo%2C_2017.svg"];
    
    CGSize screenSize = self.view.bounds.size;
    
    SVGKImageView *imageView1 = [[SVGKFastImageView alloc] initWithSVGKImage:nil];
    imageView1.frame = CGRectMake(0, 0, screenSize.width / 2, screenSize.height);
    
    SVGKImageView *imageView2 = [[SVGKLayeredImageView alloc] initWithSVGKImage:nil];
    imageView2.frame = CGRectMake(screenSize.width / 2, 0, screenSize.width / 2, screenSize.height);
    
    [self.view addSubview:imageView1];
    [self.view addSubview:imageView2];
    
    [imageView1 sd_setImageWithURL:SVGURL placeholderImage:nil options:SDWebImageRetryFailed completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image) {
            NSLog(@"SVG load success");
            NSData *svgData = [image sd_imageDataAsFormat:SDImageFormatSVG];
            NSAssert(svgData.length > 0, @"SVG Data should exist");
        }
    }];
    [imageView2 sd_setImageWithURL:SVGURL2 placeholderImage:nil options:SDWebImageRetryFailed context:@{SDWebImageContextSVGKImageSize : @(imageView2.bounds.size)} progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image) {
            NSLog(@"SVG load animation success");
            [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
                NSAnimationContext *currentContext = [NSAnimationContext currentContext];
                currentContext.duration = 2;
                imageView2.animator.bounds = CGRectMake(0, 0, screenSize.width / 4, screenSize.height / 2);
            } completionHandler:^{
                [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
                    NSAnimationContext *currentContext = [NSAnimationContext currentContext];
                    currentContext.duration = 2;
                    imageView2.animator.bounds = CGRectMake(0, 0, screenSize.width / 2, screenSize.height);
                } completionHandler:nil];
            }];
        }
    }];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
