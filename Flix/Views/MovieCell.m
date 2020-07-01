//
//  MovieCell.m
//  Flix
//
//  Created by David Lara on 6/26/20.
//  Copyright © 2020 davol00. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMovie:(Movie *)movie {
    _movie = movie;
    
    self.titleLabel.text = self.movie.title;
    self.overviewLabel.text = self.movie.overview;

    self.posterView.image = nil;
    if(self.movie.posterURL) {
        [self.posterView setImageWithURL: self.movie.posterURL];
    }
    
}

@end
