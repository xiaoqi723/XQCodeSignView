//
//  CodeSignView.h
//  XQProject
//
//  Created by XQ on 15/2/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CodeSignView : UIView

- (instancetype)initWithCGPoint:(CGPoint)point;
- (NSString *)getCodesignStr;
- (BOOL)SignWithStr:(NSString *)Str;
@end
