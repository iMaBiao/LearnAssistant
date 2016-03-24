//
//  bookCell.m
//  LearnAssistant
//
//  Created by biao on 16/1/6.
//  Copyright © 2016年 biao. All rights reserved.
//

#import "bookCell.h"
#import "Books.h"
@interface bookCell()
@property (weak, nonatomic) IBOutlet UIButton *book1;
@property (weak, nonatomic) IBOutlet UILabel *book1Name;


@end

@implementation bookCell

- (void)setBooks:(Books *)books{
    _books = books;
    
//    self.book1.imageView.image = [UIImage imageNamed:books.icon];
    [self.book1 setBackgroundImage: [UIImage imageNamed:books.icon]forState:UIControlStateNormal];
    NSLog(@"bookIcon = %@",books.icon);
    self.book1Name.text = books.name;
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    // Configure the view for the selected state
//}

@end
