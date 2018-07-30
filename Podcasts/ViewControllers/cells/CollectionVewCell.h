//
//  CollectionVewCell.h
//  PadcastsApp
//
//  Created by Dzmitry Tarelkin on 7/25/18.
//  Copyright © 2018 Dzmitry Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CollectionVewCell : UICollectionViewCell

//right StackView
@property (strong, nonatomic) UIStackView *infoStack;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *author;
@property (strong, nonatomic) UILabel *date;

//left StackView
@property (strong, nonatomic) UIStackView *imageAndTypeStack;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel     *duration;


//temp objects

@property (strong, nonatomic) NSURL* currentURL;
@property (strong, nonatomic) UIImage* currentImage;

@end
