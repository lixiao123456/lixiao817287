//
//  InformationTableViewCell.m
//  DouDemo
//
//  Created by lixiao on 15/9/23.
//  Copyright (c) 2015年 lixiao. All rights reserved.
//

#import "InformationTableViewCell.h"

@implementation InformationTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.lb_time = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        [self.lb_time setFont:[UIFont systemFontOfSize:14]];
        [self.lb_time setTextAlignment:NSTextAlignmentCenter];
        [self.lb_time setTextColor:[UIColor grayColor]];
        [self addSubview:self.lb_time];
        
        self.iv_back = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.lb_time.frame) + 8, 10, 17)];
        [self.iv_back setImage:[UIImage imageNamed:@"information_back"]];
        [self addSubview:self.iv_back];
        
        self.lb_information = [[InsetsLabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.iv_back.frame), CGRectGetMaxY(self.lb_time.frame), 0, 0)];
        [self.lb_information setFont:[UIFont systemFontOfSize:15]];
        [self.lb_information setBackgroundColor:[UIColor yellowColor]];
        self.lb_information.numberOfLines = 0;
        [self.lb_information setInsets:UIEdgeInsetsMake(INSETTOP, INSETLEFT, INSETTOP, INSETLEFT)];
        [self addSubview:self.lb_information];

    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
