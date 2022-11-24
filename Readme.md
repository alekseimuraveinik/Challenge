Version 1.0.0

Minimal supported iOS version is 14.0

List screen is made using LazyVStack which is only available in iOS 14.0 and higher. It's a suitable analog of UIKit's UITableView with a feature of list elements lazy loading. That helps the application save resources if a number of elements would be large.

Navigation is made using NavigationView (from left to right) according to Apple's guideline on navigation types.

In the project there are two assets catalogues. One (Assets) is for icons, e.g. App Icon and checkmark icon. Another (Colors) is for colors. For convenient access to assets support functions located in Palette and Images are created.

Current version of the project allows user to see the list of six items, mark them as completed and see items details. 

All six of the items are being read from .json file which is embedded in the application, but the data source can easily be changed from local to remote by implementing required logic in RemoteDataSource and changing ListViewModel's passed dependency in Container from LocalDataSource to RemoteDataSource.


Problems:
1. It is not clear what should be displayed at the top of list screen if all of the items are marked as completed. Currently displaying text in that case is "Good job!"
2. Back button on details screen is not intuitive for user outside of context. It would be better to add chevron to the left of close button to highlight the navigation effect type (in our case - from right to left)
3. Behavior of items on list screen is not clear on smaller devices (should the title shrinks or do something else)
4. Localizations absence (now only English is present)
5. Coordinators abscence. For simplicity there is no such entity as Coordinator which is responsible for screens change. It would be convinient to use cordination framework such as FlowStacks if there will be complex screen changing logic
