//
//  LFNewFeatrueCollectionViewController.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFNewFeatrueCollectionViewController.h"
#import "LFNewFeatrueCollectionViewCell.h"
@interface LFNewFeatrueCollectionViewController ()

@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation LFNewFeatrueCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = .1;
    layout.minimumInteritemSpacing = .1;
    self = [self initWithCollectionViewLayout:layout];
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

//    yindaoye1
    // Register cell classes
    [self.collectionView registerClass:[LFNewFeatrueCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.dataSource = @[@"yindaoye1",@"yindaoye2",@"yindaoye3",@"yindaoye4"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LFNewFeatrueCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:self.dataSource[indexPath.item]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


@end
