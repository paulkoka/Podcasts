//
//  mainScreenCell.m
//  Podcasts
//
//  Created by Pavel Koka on 7/29/18.
//  Copyright © 2018 Pavel Koka. All rights reserved.
//

#import "mainScreenCell.h"


@implementation mainScreenCell


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _imageView;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [[UILabel alloc] init];
        _durationLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _durationLabel.font = [UIFont systemFontOfSize:12.0];
        _durationLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        _durationLabel.textColor = UIColor.whiteColor;
    }
    return _durationLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.font = [UIFont systemFontOfSize:13.0 weight:UIFontWeightBold];
        _titleLabel.numberOfLines = 3;
    }
    return _titleLabel;
}

- (UILabel *)authorLabel {
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] init];
        _authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _authorLabel.font = [UIFont systemFontOfSize:13.0 weight:UIFontWeightLight];
    }
    return _authorLabel;
}

- (void)setupSubviews {
    self.backgroundColor = UIColor.whiteColor;
}


@end
