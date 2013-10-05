//
//  CRToolbar.m
//  SnapIn
//
//  Created by Adam Debono on 5/10/13.
//  Copyright (c) 2013 SnapIn. All rights reserved.
//

#import "CRToolbar.h"

@interface CRToolbar ()
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation CRToolbar

static CGFloat const kDefaultColorLayerOpacity = 0.5f;

- (void)setBarTintColor:(UIColor *)barTintColor {
    [super setBarTintColor:barTintColor];
    
    if (self.colorLayer == nil) {
        self.colorLayer = [CALayer layer];
        self.colorLayer.opacity = kDefaultColorLayerOpacity;
        [self.layer addSublayer:self.colorLayer];
    }
    
    self.colorLayer.backgroundColor = barTintColor.CGColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.colorLayer != nil) {
        self.colorLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        
        [self.layer insertSublayer:self.colorLayer atIndex:1];
    }
}

@end
