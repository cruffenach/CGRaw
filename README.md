### CGRaw

This is a small struct and UIKit extension written in Swift to allow for creating `CGRect`s representing raw pixels amounts. The example project draws an HSV color spectrum raw pixels by raw pixel across the bounds of any given device. 

#### Example

`CGRaw.uiKitRect(rawRect: CGRect(x: 0, y: 0, width: 1.0, height: 1.0))` will return the the following 

- iPhone 6+ `CGRect {0, 0, 0.33333, 0.3333}`
- iPhone 6, iPhone 5s, iPhone 5c, iPhone 5, iPhone 4s, iPhone 4 `CGRect {0, 0, 0.5, 0.5}`
- iPhone 3Gs, iPhone 3G, iPhone `CGRect {0, 0, 1.0, 1.0}`

You can also use an extension on `CGRect` to get the same result

`CGRect(x: 0, y: 0, width: 1.0, height: 1.0).rawRect`

#### Raw Noise

![](6+ Noise.png)