//
//  CustomCell.h
//  TableViewCell
//
//  Created by Alex on 15/10/22.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowImageView.h"

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet ShowImageView *showImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLbl;

- (void)updateUI;

@end
