//
//  ViewController.m
//  TableViewCell
//
//  Created by Alex on 15/10/22.
//  Copyright © 2015年 Alex. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
    
}

- (void)updateRefreshers
{
    [_tableView reloadData];
}

- (void)loadData
{
    _dataArray  = [NSMutableArray new];
    
    for (NSInteger i=0; i< 10; i++) {
        [_dataArray addObject:[NSString stringWithFormat:@"%ld",i]];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"CustomCell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
   
    [cell.showImageView setImageArray:_dataArray];
    [cell updateUI];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CustomCell *cell = (CustomCell *)[tableView cellForRowAtIndexPath:indexPath];
        [self customDeleteButtonInCell:cell originCell:cell];
    });

    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"取消";
}

#pragma mark - 自定义方法
- (void)customDeleteButtonInCell:(UIView *)view originCell:(CustomCell *)cell
{
    for (UIButton *subView in view.subviews) {
        if (subView == cell.contentView) {
            continue;
        }
        if ([subView isKindOfClass:[UIButton class]]) {
            NSString *title = [subView titleForState:UIControlStateNormal];
            if ([title isEqualToString:@"取消"]) {
                
                CGRect frame = subView.frame;
                frame.size.height  = cell.frame.size.height;
                subView.frame = frame;
                
                subView.backgroundColor = [UIColor orangeColor];
                subView.superview.backgroundColor = [UIColor clearColor];
            }
        }
        [self customDeleteButtonInCell:subView originCell:cell];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        NSLog(@"取消");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
