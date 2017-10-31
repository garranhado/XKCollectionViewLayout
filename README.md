# XKCollectionViewLayout
Simple UICollectionViewFlowLayout subclass for common grid layouts

## Sample 1

```Objective-C
    layout.layoutModeC = XKCollectionViewLayoutModeFill;
    
    // Fill mode keep the same number of cells per row, default = 0
     
    layout.numberOfItemsPerRowC = 0;
     
    // Fill mode should resize cell keeping size aspect, adding extent to final height
    
    layout.cellSizeC = CGSizeMake(100.0, 100.0);
    layout.cellExtentC = 44.0;
    
    // Cell margin and spacing
    
    layout.marginC = CGSizeMake(10.0, 10.0);
    layout.spacingC = CGSizeMake(10.0, 10.0);
```
![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/00P.png)

![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/00L.png)

## Sample 2

```Objective-C
    layout.layoutModeC = XKCollectionViewLayoutModeFill;
    
    // Fill mode keep the same number of cells per row, default = 0
    
    layout.numberOfItemsPerRowC = 2;
    
    // Fill mode should resize cell keeping size aspect, adding extent to final height
    
    layout.cellSizeC = CGSizeMake(100.0, 100.0);
    layout.cellExtentC = 44.0;
    
    // Cell margin and spacing
    
    layout.marginC = CGSizeMake(10.0, 10.0);
    layout.spacingC = CGSizeMake(10.0, 10.0);
```
![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/01P.png)

![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/01L.png)

## Sample 3

```Objective-C
    layout.layoutModeC = XKCollectionViewLayoutModeDisperse;
    
    // Fill mode keep the same number of cells per row, default = 0
    
    layout.numberOfItemsPerRowC = 0;
    
    // Fill mode should resize cell keeping size aspect, adding extent to final height
    
    layout.cellSizeC = CGSizeMake(100.0, 144.0);
    layout.cellExtentC = 0.0;
    
    // Cell margin and spacing
    
    layout.marginC = CGSizeMake(10.0, 10.0);
    layout.spacingC = CGSizeMake(10.0, 10.0);
```
![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/02P.png)

![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/02L.png)

## Sample 4

```Objective-C
    layout.layoutModeC = XKCollectionViewLayoutModeCenter;
    
    // Fill mode keep the same number of cells per row, default = 0
    
    layout.numberOfItemsPerRowC = 0;
    
    // Fill mode should resize cell keeping size aspect, adding extent to final height
    
    layout.cellSizeC = CGSizeMake(100.0, 144.0);
    layout.cellExtentC = 0.0;
    
    // Cell margin and spacing
    
    layout.marginC = CGSizeMake(10.0, 10.0);
    layout.spacingC = CGSizeMake(10.0, 10.0);
```
![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/03P.png)

![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/03L.png)

## Sample 5

```Objective-C
    layout.layoutModeC = XKCollectionViewLayoutModeLeft;
    
    // Fill mode keep the same number of cells per row, default = 0
    
    layout.numberOfItemsPerRowC = 0;
    
    // Fill mode should resize cell keeping size aspect, adding extent to final height
    
    layout.cellSizeC = CGSizeMake(100.0, 144.0);
    layout.cellExtentC = 0.0;
    
    // Cell margin and spacing
    
    layout.marginC = CGSizeMake(10.0, 10.0);
    layout.spacingC = CGSizeMake(10.0, 10.0);
```
![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/04P.png)

![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/04L.png)

## Sample 6

```Objective-C
    layout.layoutModeC = XKCollectionViewLayoutModeRight;
    
    // Fill mode keep the same number of cells per row, default = 0
    
    layout.numberOfItemsPerRowC = 0;
    
    // Fill mode should resize cell keeping size aspect, adding extent to final height
    
    layout.cellSizeC = CGSizeMake(100.0, 144.0);
    layout.cellExtentC = 0.0;
    
    // Cell margin and spacing
    
    layout.marginC = CGSizeMake(10.0, 10.0);
    layout.spacingC = CGSizeMake(10.0, 10.0);
```
![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/05P.png)

![Screenshot](https://github.com/garranhado/XKCollectionViewLayout/blob/master/Samples/05L.png)
