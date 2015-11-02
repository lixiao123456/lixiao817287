//
//  ViewController.m
//  DouDemo
//
//  Created by lixiao on 15/9/23.
//  Copyright (c) 2015年 lixiao. All rights reserved.
//

#import "ViewController.h"
#import "InformationTableViewCell.h"
#import "AutoScrollLabel.h"
#import "MarqueeLabel.h"

#define MAXWIDTH 300
#define DEMO @"demo" //用来确定单行高度

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView    *tb_information;
@property (nonatomic,strong)NSMutableArray *arr_time;
@property (nonatomic,strong)NSMutableArray *arr_informationDetail;
@property (nonatomic,strong)NSMutableArray *arr_width;
@property (nonatomic,strong)NSMutableArray *arr_height;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arr_informationDetail = (NSMutableArray *)@[@"年世界杯长时间不成熟不成熟不成熟的不错就好设备厂家算补偿算补偿聚划算不长时间不成都商报长岛冰茶都不吃都不吃",@"难上加难新世纪可能性是几十年是会计出纳",@"那就是那才叫说不出技"];
    self.arr_time = (NSMutableArray *)@[@"2015-9-10 10:23",@"2015-9-11 10:26",@"2015-9-13 10:27"];
    self.arr_width = [NSMutableArray array];
    self.arr_height = [NSMutableArray array];
    
    for (NSString * str in self.arr_informationDetail) {
        
        CGFloat width = [self fittingLabelWidthWithHeight:18 andFontSize:[UIFont systemFontOfSize:FONT_SIZE] withText:str];
        CGFloat height = [self fittingLabelHeightWithWidth:MAXWIDTH andFontSize:[UIFont systemFontOfSize:FONT_SIZE] withText:DEMO];
        
        if (width > MAXWIDTH) {
            width = MAXWIDTH;
             height = [self fittingLabelHeightWithWidth:MAXWIDTH andFontSize:[UIFont systemFontOfSize:FONT_SIZE] withText:str];
        }
        [self.arr_width addObject:[NSNumber numberWithFloat:width + INSETLEFT * 2]];
        [self.arr_height addObject:[NSNumber numberWithFloat:height + INSETTOP * 2]];
    }
    [self onCreate];
    
    AutoScrollLabel *lb_scroller = [[AutoScrollLabel alloc]initWithFrame:CGRectMake(100, 300, 100, 30)];
    [self.view addSubview:lb_scroller];
    [lb_scroller setBackgroundColor:[UIColor yellowColor]];
    lb_scroller.scrollDirection = AUTOSCROLL_SCROLL_LEFT;
    lb_scroller.text = @"这是急";
    lb_scroller.textColor = [UIColor blackColor];
    
    
    MarqueeLabel *durationLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(10, 400, self.view.frame.size.width-20.0f, 20.0f) duration:8.0 andFadeLength:10.0f];
    durationLabel.tag = 101;
    durationLabel.numberOfLines = 1;
    durationLabel.marqueeType = MLContinuous;
    durationLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    durationLabel.textAlignment = NSTextAlignmentLeft;
    durationLabel.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    durationLabel.backgroundColor = [UIColor clearColor];
    durationLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0f];
    durationLabel.text = @"This is a test of the label.你你你你你你你你你你你你你你你你你你你你你你 ";
    [self.view addSubview:durationLabel];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)onCreate{
    
    self.tb_information = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    self.tb_information.delegate = self;
    self.tb_information.dataSource = self;
    self.tb_information.separatorColor = [UIColor clearColor];
    [self.view addSubview:self.tb_information];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr_time.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [[self.arr_height objectAtIndex:indexPath.row] floatValue] + 5 + 20 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"InformationCell";
    InformationTableViewCell *cell = (InformationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[InformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.lb_time setText:[self.arr_time objectAtIndex:indexPath.row]];
    [cell.lb_information setFrame:CGRectMake(cell.lb_information.frame.origin.x, cell.lb_information.frame.origin.y, [[self.arr_width objectAtIndex:indexPath.row] floatValue], [[self.arr_height objectAtIndex:indexPath.row] floatValue])];
    [cell.lb_information setText:[self.arr_informationDetail objectAtIndex:indexPath.row]];
 
    return cell;
}

- (CGFloat)fittingLabelHeightWithWidth:(CGFloat)width andFontSize:(UIFont *)font withText:(NSString *)str_information
{
    if (self && ![str_information isEqualToString:@""]) {
        return [str_information boundingRectWithSize:CGSizeMake(width, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.height + 2;
    }else{
        return 0;
    }
}

- (CGFloat)fittingLabelWidthWithHeight:(CGFloat)height andFontSize:(UIFont *)font withText:(NSString *)str_information
{
    if (self && ![str_information isEqualToString:@""]) {
        return [str_information boundingRectWithSize:CGSizeMake(0, height) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.width + 2;
    }else{
        return 0;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
