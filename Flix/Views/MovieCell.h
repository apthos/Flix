//
//  MovieCell.h
//  Flix
//
//  Created by David Lara on 6/26/20.
//  Copyright © 2020 davol00. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end

NS_ASSUME_NONNULL_END
