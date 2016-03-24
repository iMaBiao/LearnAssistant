//
//  CustomTableViewCell.m
//  京东
//
//  Created by midmirror on 15/10/12.
//  Copyright (c) 2015年 midmirror. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initAddSubViews];
    }
    return self;
}

- (void)initAddSubViews
{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 200, 25)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    
    self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 35, 290, 25)];
    self.detailLabel.backgroundColor = [UIColor clearColor];
    
    self.rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 10, 65, 25)];
    self.rightLabel.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.rightLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
