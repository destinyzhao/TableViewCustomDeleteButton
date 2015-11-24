//
//  ShowImageView.m
//  TableViewCell
//
//  Created by Alex on 15/10/22.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "ShowImageView.h"

#define ImageViewHeigh 50.0
#define ImageViewWidth 60.0

@interface ShowImageView()

@property (strong, nonatomic) UIScrollView  *scrollView;

@end

@implementation ShowImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initWithSetting];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initWithSetting];
    }
    return self;
}

- (void)initWithSetting
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width-4, 60)];
    _scrollView.directionalLockEnabled = YES; //只能一个方向滑动
    _scrollView.pagingEnabled = NO; //是否翻页
//    _scrollView.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.5f];
    _scrollView.showsVerticalScrollIndicator = NO; //垂直方向的滚动指示
    _scrollView.showsHorizontalScrollIndicator = NO;//水平方向的滚动指示
    [self addSubview:_scrollView];
}

- (void)setImageArray:(NSMutableArray *)imageArray
{
    _imageArray = imageArray;
    
    [imageArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(10+idx*(ImageViewWidth+10), 5, ImageViewWidth, ImageViewHeigh);
        imageView.backgroundColor = [UIColor yellowColor];
        [_scrollView addSubview:imageView];
    }];
    
    CGSize newSize = CGSizeMake(imageArray.count*(ImageViewWidth+10)+10, 0);
    [_scrollView setContentSize:newSize];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
