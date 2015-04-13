//
//  CodeSignView.m
//  XQProject
//
//  Created by apple on 15/2/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CodeSignView.h"

@implementation CodeSignView
{
    UILabel * yzmapictures;
    NSArray *changeArray;
    NSMutableString * changeString;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        //必须取消自动布局
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 80, 40);
        changeArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
        yzmapictures=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
        yzmapictures.textColor=[UIColor purpleColor];
        yzmapictures.textAlignment=NSTextAlignmentCenter;
        yzmapictures.font=[UIFont fontWithName:@"CourierNewPS-BoldMT" size:28.0];
        yzmapictures.backgroundColor=[UIColor clearColor];
        self.backgroundColor=[UIColor colorWithWhite:0.9 alpha:1];
        yzmapictures.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(change)];
        [yzmapictures addGestureRecognizer:tapGesture];
        [self addSubview:yzmapictures];
        [self change];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

// 干扰线
- (void)drawRect:(CGRect)rect {
    float pX, pY;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    for(int a = 0; a < 4; a++) {
        float red = arc4random() % 100 / 100.0;
        float green = arc4random() % 100 / 100.0;
        float blue = arc4random() % 100 / 100.0;
        UIColor* color1 = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        CGContextSetStrokeColorWithColor(context, [color1 CGColor]);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        CGContextStrokePath(context);
    }
}

- (instancetype)initWithCGPoint:(CGPoint)point
{
    self = [super initWithFrame:CGRectMake(point.x, point.y, 80, 40)];
    if (self) {
        changeArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
        yzmapictures=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
        yzmapictures.textColor=[UIColor purpleColor];
        yzmapictures.textAlignment=NSTextAlignmentCenter;
        yzmapictures.font=[UIFont fontWithName:@"CourierNewPS-BoldMT" size:28.0];
        yzmapictures.backgroundColor=[UIColor clearColor];
        self.backgroundColor=[UIColor colorWithWhite:0.9 alpha:1];
        yzmapictures.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(change)];
        [yzmapictures addGestureRecognizer:tapGesture];
        [self addSubview:yzmapictures];
        [self change];
    }
    return self;
}
- (void)change
{
    [self setNeedsDisplay];
    NSMutableString *getStr = [[NSMutableString alloc] initWithCapacity:5]; //可变字符串，存取得到的随机数
    changeString = [[NSMutableString alloc] initWithCapacity:6];            //可变string，最终想要的验证码
    for(NSInteger a = 0; a < 4; a++)                                        //得到四个随机字符，取四次
    {
        NSInteger index = arc4random() % ([changeArray count] - 1);         //得到数组中随机数的下标
        getStr = [changeArray objectAtIndex:index];                         //得到数组中随机数，赋给getStr
        changeString = (NSMutableString *)[changeString stringByAppendingString:getStr];
        //把随机字符加到可变string后面，循环四次后取完
    }
    yzmapictures.text = [NSString stringWithFormat:@"%@",changeString];
    
    //  yzmapictures.text  = changeString;
    
    //两句是取四位随机数字
    //  int number = arc4random() % 8999 + 1000;
    //  yzmapictures.text = [NSString stringWithFormat:@"   %d",number];
}

- (NSString *)getCodesignStr
{
    return changeString;
}

-(BOOL)SignWithStr:(NSString *)Str
{
    NSString *codeStr1=[[changeString uppercaseString] uppercaseString];
    NSString *codeStr2=[Str uppercaseString];
    
    if ([codeStr1 isEqualToString:codeStr2]) {
            return YES;
        }
    return NO;
}

@end
