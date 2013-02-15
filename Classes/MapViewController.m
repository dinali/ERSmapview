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

#import "MapViewController.h"

@implementation MapViewController

@synthesize mapView = _mapView;
@synthesize dynamicLayer = _dynamicLayer;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// set the delegate for the map view
	self.mapView.layerDelegate = self;
	
	//create an instance of a tiled map service layer
	AGSTiledMapServiceLayer *tiledLayer = [[AGSTiledMapServiceLayer alloc] initWithURL:[NSURL URLWithString:kTiledMapServiceURL]];
	
	//Add it to the map view
	[self.mapView addMapLayer:tiledLayer withName:@"Tiled Layer"];
    
    //zoom to California
    
    AGSEnvelope *envelope = [AGSEnvelope envelopeWithXmin:-124.83145667 ymin:30.49849464 xmax:-113.91375495  ymax:44.69150688  spatialReference:_mapView.spatialReference];
    
    [self.mapView zoomToEnvelope:envelope animated:NO];
    
    // TODO: this is not North America
    //AGSEnvelope *envelope = [AGSEnvelope envelopeWithXmin:-17803291.2698583 ymin:-2088884.58214129 xmax:-4838682.00730645
                                                   //  ymax:11945239.7302388
                                        // spatialReference:_mapView.spatialReference];
    
    [self.mapView zoomToEnvelope:envelope animated:NO];
	
	//create an instance of a dynmaic map layer
	self.dynamicLayer = [[AGSDynamicMapServiceLayer alloc] initWithURL:[NSURL URLWithString:kDynamicMapServiceURL]];
	
	//set visible layers -- make sure you pick an ERS layer that works
	self.dynamicLayer.visibleLayers = [NSArray arrayWithObjects:[NSNumber numberWithInt:0], nil];
	
	//name the layer. This is the name that is displayed if there was a property page, tocs, etc...
	[self.mapView addMapLayer:self.dynamicLayer withName:@"Dynamic Layer"];
	
	//set transparency
	self.dynamicLayer.opacity = 0.2;
    
    // current location marker
    [self.mapView.locationDisplay startDataSource];
    
    //1. Zooming
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respond:)
   //                                              name:AGSMapViewDidEndZoomingNotification object: nil];
    //1. Panning
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respond:)
   //                                              name:AGSMapViewDidEndPanningNotification object: nil];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    self.mapView = nil;
	self.dynamicLayer = nil;
}


- (void)dealloc {
	
}

- (IBAction)opacitySliderValueChanged:(id)sender {
	// set the layer's opacity based on the value of the slider
	self.dynamicLayer.opacity = ((UISlider *)sender).value;
}


#pragma mark AGSMapViewLayerDelegate methods

-(void) mapViewDidLoad:(AGSMapView*)mapView {

	// comment to disable the GPS on start up
	[self.mapView.locationDisplay startDataSource];
    self.mapView.locationDisplay.autoPanMode = AGSLocationDisplayAutoPanModeDefault;
}

@end
