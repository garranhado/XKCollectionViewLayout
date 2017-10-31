#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XKCollectionViewLayoutMode) {
    XKCollectionViewLayoutModeDefault = 0,
    XKCollectionViewLayoutModeFill = 1,
    XKCollectionViewLayoutModeDisperse = 2,
    XKCollectionViewLayoutModeCenter = 3,
    XKCollectionViewLayoutModeLeft = 4,
    XKCollectionViewLayoutModeRight = 5
};

/*
 
 Size Classes
 
 R - Regular
 C - Compact
 
 */

@interface XKCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic) XKCollectionViewLayoutMode layoutModeR;
@property (nonatomic) XKCollectionViewLayoutMode layoutModeC;
// Hack to use layoutMode in interface builder
@property (nonatomic) IBInspectable NSInteger layoutModeIndexR;
@property (nonatomic) IBInspectable NSInteger layoutModeIndexC;

// Fill mode keep the same number of cells per row, default = 0
@property (nonatomic) IBInspectable NSInteger numberOfItemsPerRowR;
@property (nonatomic) IBInspectable NSInteger numberOfItemsPerRowC;

// Fill mode should resize cell keeping size aspect, adding extent to final height
@property (nonatomic) IBInspectable CGSize cellSizeR;
@property (nonatomic) IBInspectable CGSize cellSizeC;
@property (nonatomic) IBInspectable float cellExtentR;
@property (nonatomic) IBInspectable float cellExtentC;

// Cell margin and spacing
@property (nonatomic) IBInspectable CGSize marginR;
@property (nonatomic) IBInspectable CGSize marginC;
@property (nonatomic) IBInspectable CGSize spacingR;
@property (nonatomic) IBInspectable CGSize spacingC;

// Dynamic sizing
@property (nonatomic) BOOL useEstimatedItemSize;

@end

@interface XKPagedCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic) NSInteger currentPage;
@property (nonatomic) NSInteger numberOfPages;

@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

- (void)setCurrentPage:(NSInteger)currentPage
              animated:(BOOL)animated;

@end

@protocol XKCollectionViewFrameSource <NSObject>

- (CGRect)frameForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface XKCustomCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, weak) id<XKCollectionViewFrameSource> frameSource;

@end
