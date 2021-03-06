// Copyright 2010 ESRI
//
// All rights reserved under the copyright laws of the United States
// and applicable international laws, treaties, and conventions.
//
// You may freely redistribute and use this sample code, with or
// without modification, provided you include the original copyright
// notice and use restrictions.
//
// See the use restrictions at http://help.arcgis.com/en/sdk/10.0/usageRestrictions.htm
//

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>

#define kTiledMapServiceURL @"http://server.arcgisonline.com/ArcGIS/rest/services/ESRI_StreetMap_World_2D/MapServer"
// #define kDynamicMapServiceURL @"http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Specialty/ESRI_StateCityHighway_USA/MapServer"

// Food Availability
//#define kDynamicMapServiceURL @"http://gis.ers.usda.gov/ArcGIS/rest/services/fa_access/MapServer"

// Food Desert Locator

#define kDynamicMapServiceURL @"http://gis.ers.usda.gov/ArcGIS/rest/services/FoodDesert_6529/MapServer"

//Set up constant for predefined where clause for search
#define kLayerDefinitionFormat @"STATE_NAME = '%@'"


@interface MapViewDemoViewController : UIViewController <AGSMapViewLayerDelegate> {
	
	//container for map layers
	AGSMapView *_mapView;
	
	//this map has a dynamic layer, need a view to act as a container for it
	AGSDynamicMapServiceLayer * _dynamicLayer;
}

//map view is an outlet so we can associate it with UIView
//in IB
@property (nonatomic, strong) IBOutlet AGSMapView *mapView;
@property (nonatomic, strong) AGSDynamicMapServiceLayer *dynamicLayer;

- (IBAction)opacitySliderValueChanged:(id)sender;

@end

/* maybe this should be used instead?
 //Now
 //1. Adopt AGSLayerDelegate protocol
 @interface MyViewController : UIViewController <AGSLayerDelegate>
 
 //2. Set your class as AGSLayer's delegate
 layer.delegate = self;
 
 //3. Implement method for success
 - (void) layerDidLoad:(AGSLayer*) layer
 
 //4. Implement method for error
 - (void) layer:(AGSLayer*) layer didFailToLoadWithError:(NSError*)error
 */

