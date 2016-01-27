//
//  ViewController.m
//  Demo
//
//  Created by Mrss on 16/1/27.
//  Copyright © 2016年 expai. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+Popover.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.data = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<3; i++) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSInteger j = 0; j<5; j++) {
            [array addObject:[NSString stringWithFormat:@"section:%ld index:%ld",i,j]];
        }
        [self.data addObject:array];
    }
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.data[section];
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray *array = self.data[indexPath.section];
    cell.textLabel.text = array[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *header = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    header.backgroundColor = [UIColor yellowColor];
    header.textAlignment = NSTextAlignmentCenter;
    header.text = [NSString stringWithFormat:@"Header:%ld",section];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UILabel *footer = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    footer.backgroundColor = [UIColor cyanColor];
    footer.textAlignment = NSTextAlignmentCenter;
    footer.text = [NSString stringWithFormat:@"Footer:%ld",section];
    return footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSArray *names = @[@"Reply",@"Share",@"Copy",@"Report"];
    NSArray *images = @[@"popover_reply",@"popover_share",@"popover_copy",@"popover_report"];
    NSMutableArray *items = [NSMutableArray array];
    for (NSInteger i = 0; i<names.count; i++) {
        PopoverItem *item = [[PopoverItem alloc]initWithName:names[i] image:[UIImage imageNamed:images[i]] selectedHandler:^(PopoverItem *item) {
            NSLog(@"name:%@ indexPath%@",item.name,indexPath);
        }];
        [items addObject:item];
    }
    [tableView showPopoverWithItems:items forIndexPath:indexPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
