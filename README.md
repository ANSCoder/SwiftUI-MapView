# SwiftUI-MapView

Basic Map view in Swift UI.

<img width="1427" alt="Screenshot 2019-12-12 at 11 54 28 PM" src="https://user-images.githubusercontent.com/19596311/70739799-acf26a00-1d3d-11ea-8e97-bd72849f3ae8.png">


### Create MapView in SwiftUI.

```swift

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let landmarks = LandmarkAnnotation.requestMockData()
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }
    
    /**
     - Description - Replace the body with a make UIView(context:) method that creates and return an empty MKMapView
     */
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        //If you changing the Map Annotation then you have to remove old Annotations
        //mapView.removeAnnotations(mapView.annotations)
        view.delegate = context.coordinator
        view.addAnnotations(landmarks)
    }
}
```

### Mixing UIKit inside SwiftUI by using Coordinator.

```swift
import MapKit

/*
  Coordinator for using UIKit inside SwiftUI.
 */
class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
      var mapViewController: MapView
        
      init(_ control: MapView) {
          self.mapViewController = control
      }
        
      func mapView(_ mapView: MKMapView, viewFor
           annotation: MKAnnotation) -> MKAnnotationView?{
         //Custom View for Annotation
          let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
          annotationView.canShowCallout = true
          //Your custom image icon
          annotationView.image = UIImage(named: "locationPin")
          return annotationView
       }
}

```

## Checkout my complete blog [here](https://medium.com/flawless-app-stories/mapkit-in-swiftui-c0cc2b07c28a).
