//
//  CustomCell.m
//  TableViewCell
//
//  Created by Alex on 15/10/22.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

#pragma mark -
#pragma mark - 自定义方法
- (NSInteger)getPassSeconds
{
    NSString *createTime = @"2015-10-23 14:28:20";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDate *createDate = [dateFormatter dateFromString:createTime];
    
    NSDate *curDate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: curDate];
    NSDate *localeDate = [curDate  dateByAddingTimeInterval: interval];
    
    NSTimeInterval passSeconds = [localeDate timeIntervalSinceDate:createDate];
    return passSeconds;
}

- (void)updateTimeWithSeconds:(NSInteger)seconds
{
    NSInteger s = ((NSInteger)seconds%60);
    NSInteger m = ((NSInteger)(seconds%3600)/60);
    NSInteger h = ((NSInteger)seconds/3600);
    _timeLbl.text = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",h,m,s];
}

- (void)updateUI
{
    NSInteger leftSeconds = [self getPassSeconds];
    if (leftSeconds > 0) {
        [self updateTimeWithSeconds:leftSeconds];
    }else{
        _timeLbl.text = @"0";
    }
}

- (void)awakeFromNib {
    // Initialization code
   
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
