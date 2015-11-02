//
//  InformationTableViewCell.h
//  DouDemo
//
//  Created by lixiao on 15/9/23.
//  Copyright (c) 2015年 lixiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsetsLabel.h"
#define  FONT_SIZE 15

@interface InformationTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *iv_back;
@property (nonatomic,strong)UILabel     *lb_time;
@property (nonatomic,strong)InsetsLabel *lb_information;


@end
