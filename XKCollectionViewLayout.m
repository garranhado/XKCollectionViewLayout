#import "XKCollectionViewLayout.h"

@implementation XKCollectionViewLayout

- (void)setLayoutModeIndexR:(NSInteger)layoutModeIndexR {
    _layoutModeIndexR = layoutModeIndexR;
    self.layoutModeR = (XKCollectionViewLayoutMode)layoutModeIndexR;
}

- (void)setLayoutModeIndexC:(NSInteger)layoutModeIndexC {
    _layoutModeIndexC = layoutModeIndexC;
    self.layoutModeC = (XKCollectionViewLayoutMode)layoutModeIndexC;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    if (!self.collectionView) {
        return;
    }
    
    // Setup
    
    CGRect frame = self.collectionView.frame;
    
    BOOL compact = !(self.collectionView.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular &&
                    self.collectionView.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular);
    
    XKCollectionViewLayoutMode layoutMode = compact ? self.layoutModeC : self.layoutModeR;
    
    NSInteger numberOfItemsPerRow = compact ? self.numberOfItemsPerRowC : self.numberOfItemsPerRowR;
    
    CGSize cellSize = compact ? self.cellSizeC : self.cellSizeR;
    float cellExtent = compact ? self.cellExtentC : self.cellExtentR;
    
    CGSize margin = compact ? self.marginC : self.marginR;
    CGSize spacing = compact ? self.spacingC : self.spacingR;
    
    //
    
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
        self.minimumInteritemSpacing = spacing.width;
        self.minimumLineSpacing = spacing.height;
    } else {
        self.minimumInteritemSpacing = spacing.height;
        self.minimumLineSpacing = spacing.width;
    }
    
    switch (layoutMode) {
        case XKCollectionViewLayoutModeFill: {
            float aspect = cellSize.width / cellSize.height;
            
            if (numberOfItemsPerRow == 0) {
                int count = (int)MAX(frame.size.width / cellSize.width, 1.0);
                float availableWidth = frame.size.width - (spacing.width * (float)(count - 1)) - (margin.width * 2.0);
                float w = floor(availableWidth / (float)count);
                
                self.itemSize = CGSizeMake(w, (w / aspect) + cellExtent);
                self.sectionInset = UIEdgeInsetsMake(margin.height, margin.width, margin.height, margin.width);
            } else {
                float availableWidth = frame.size.width - ((spacing.width * (float)(numberOfItemsPerRow - 1)) + (margin.width * 2.0));
                float w = floor(availableWidth / (float)numberOfItemsPerRow);
                
                self.itemSize = CGSizeMake(w, (w / aspect) + cellExtent);
                self.sectionInset = UIEdgeInsetsMake(margin.height, margin.width, margin.height, margin.width);
            }
        } break;
        case XKCollectionViewLayoutModeDisperse: {
            int count = (int)floor(MAX(frame.size.width / cellSize.width, 1.0));
            float availableWidth = frame.size.width - (spacing.width * (float)(count - 1)) - (margin.width * 2.0);
            count = (int)floor(MAX(availableWidth / cellSize.width, 1.0));
            availableWidth = frame.size.width - (cellSize.width * (float)count);
            
            float pw = floor(availableWidth / (float)(count + 1));
            
            self.itemSize = cellSize;
            self.sectionInset = UIEdgeInsetsMake(margin.height, pw, margin.height, pw);
        } break;
        case XKCollectionViewLayoutModeCenter: {
            int count = (int)floor(MAX(frame.size.width / cellSize.width, 1.0));
            float availableWidth = frame.size.width - (spacing.width * (float)(count - 1)) - (margin.width * 2.0);
            count = (int)floor(MAX(availableWidth / cellSize.width, 1.0));
            availableWidth = frame.size.width - (cellSize.width * (float)count) - (spacing.width * (float)(count - 1));
            
            float pw = floor(availableWidth / 2.0);
            
            self.itemSize = cellSize;
            self.sectionInset = UIEdgeInsetsMake(margin.height, pw, margin.height, pw);
        } break;
        case XKCollectionViewLayoutModeLeft: {
            int count = (int)floor(MAX(frame.size.width / cellSize.width, 1.0));
            float availableWidth = frame.size.width - (spacing.width * (float)(count - 1)) - (margin.width * 2.0);
            count = (int)floor(MAX(availableWidth / cellSize.width, 1.0));
            availableWidth = frame.size.width - (cellSize.width * (float)count) - (spacing.width * (float)(count - 1));
            
            float pw = floor(availableWidth - spacing.width);
            
            self.itemSize = cellSize;
            self.sectionInset = UIEdgeInsetsMake(margin.height, margin.width, margin.height, pw);
        } break;
        case XKCollectionViewLayoutModeRight: {
            int count = (int)floor(MAX(frame.size.width / cellSize.width, 1.0));
            float availableWidth = frame.size.width - (spacing.width * (float)(count - 1)) - (margin.width * 2.0);
            count = (int)floor(MAX(availableWidth / cellSize.width, 1.0));
            availableWidth = frame.size.width - (cellSize.width * (float)count) - (spacing.width * (float)(count - 1));
            
            float pw = floor(availableWidth - spacing.width);
            
            self.itemSize = cellSize;
            self.sectionInset = UIEdgeInsetsMake(margin.height, pw, margin.height, margin.width);
        } break;
        default: {
            self.itemSize = cellSize;
            self.sectionInset = UIEdgeInsetsMake(margin.height, margin.width, margin.height, margin.width);
        } break;
    }
    
    self.estimatedItemSize = self.useEstimatedItemSize ? self.itemSize : CGSizeZero;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !(CGSizeEqualToSize(newBounds.size, self.collectionView.bounds.size));
}

@end

@implementation XKPagedCollectionViewLayout

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    
    if (self.pageControl) {
        self.pageControl.currentPage = currentPage;
    }
    
    if (self.collectionView) {
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            self.collectionView.contentOffset = CGPointMake(0.0, self.collectionView.frame.size.height * currentPage);
        } else {
            self.collectionView.contentOffset = CGPointMake(self.collectionView.frame.size.width * currentPage, 0.0);
        }
    }
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    _numberOfPages = numberOfPages;
    
    if (self.pageControl) {
        self.pageControl.numberOfPages = numberOfPages;
    }
}

- (void)setCurrentPage:(NSInteger)currentPage
              animated:(BOOL)animated {
    
    _currentPage = currentPage;
    
    if (self.pageControl) {
        self.pageControl.currentPage = currentPage;
    }
    
    if (self.collectionView) {
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            [self.collectionView setContentOffset:CGPointMake(0.0, self.collectionView.frame.size.height * currentPage)
                                         animated:animated];
        } else {
            [self.collectionView setContentOffset:CGPointMake(self.collectionView.frame.size.width * currentPage, 0.0)
                                         animated:animated];
        }
    }
}

- (void)prepareLayout {
    [super prepareLayout];
    
    if (!self.collectionView) {
        return;
    }
    
    self.numberOfPages = (int)[self.collectionView numberOfItemsInSection:0];
    
    self.minimumInteritemSpacing = 0.0;
    self.minimumLineSpacing = 0.0;
    
    self.itemSize = self.collectionView.frame.size;
    self.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    
    self.estimatedItemSize = CGSizeZero;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                 withScrollingVelocity:(CGPoint)velocity {
    
    if (self.collectionView) {
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            _currentPage = floor(proposedContentOffset.y / self.collectionView.frame.size.height);
        } else {
            _currentPage = floor(proposedContentOffset.x / self.collectionView.frame.size.width);
        }
        
        if (self.pageControl) {
            self.pageControl.currentPage = self.currentPage;
        }
    }
    
    return proposedContentOffset;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    
    if (self.collectionView) {
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            return CGPointMake(proposedContentOffset.x, self.collectionView.frame.size.height * self.currentPage);
        } else {
            return CGPointMake(self.collectionView.frame.size.width * self.currentPage, proposedContentOffset.y);
        }
    }
    
    return proposedContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    if (!CGSizeEqualToSize(newBounds.size, self.collectionView.bounds.size)) {
        self.itemSize = newBounds.size;
        return YES;
    }
    
    return NO;
}

@end

@interface XKCustomCollectionViewLayout ()

@property (nonatomic) NSMutableDictionary<NSIndexPath *, UICollectionViewLayoutAttributes *> *layoutAttributes;
@property (nonatomic) CGSize contentSize;

@end

@implementation XKCustomCollectionViewLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    if (!self.collectionView) {
        return;
    }
    
    NSInteger numItems = [self.collectionView numberOfItemsInSection:0];
    CGRect auxFrame = CGRectZero;
    
    self.layoutAttributes = [NSMutableDictionary dictionary];
    for (int i = 0; i < numItems; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i
                                                     inSection:0];
        
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attribute.frame = [self.frameSource frameForItemAtIndexPath:indexPath];
        
        [self.layoutAttributes setObject:attribute
                                  forKey:indexPath];
        
        auxFrame = CGRectUnion(auxFrame, attribute.frame);
    }
    
    self.contentSize = auxFrame.size;
}

- (CGSize)collectionViewContentSize {
    return self.contentSize;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray<UICollectionViewLayoutAttributes *> *attributes = [NSMutableArray array];
    
    for (UICollectionViewLayoutAttributes *a in self.layoutAttributes.allValues) {
        if (CGRectIntersectsRect(a.frame, rect)) {
            [attributes addObject:a];
        }
    }
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.layoutAttributes[indexPath];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !(CGSizeEqualToSize(newBounds.size, self.collectionView.bounds.size));
}

@end
