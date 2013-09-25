## Live Texture Updater Plug-in for Generator (Modified Image Asset Generation Plug-in) 

This repository contains a plug-in for Adobe Photoshop CC's Generator extensibility layer. This plug-in makes it easier for users to export image assets from their Photoshop files. Users simply enable image asset generation for a document and name layers (or layer groups, or smart objects) they want exported using a filename-like syntax. Generator then watches these layers, and any time they change, automatically updates the corresponding assets on disk.

This plugin has the ability to added a top layer with the name of "root=./my/path" and put folders into the layer names. It also provides a WebSocket server that clients can connect to and get image change events to reload texture in realtime.

To learn more about Generator and creating your own Generator plug-ins, please visit the [Generator Core repo](https://github.com/adobe-photoshop/generator-core).

### Usage

The [Functional Spec](https://github.com/adobe-photoshop/generator-assets/wiki/Generate-Web-Assets-Functional-Spec)
provides basic information about how to use the Image Assets plug-in.
Another good source of information is Samartha Vashishtha's blog post
[A closer look at the Photoshop Generator syntax](http://blogs.adobe.com/samartha/2013/09/a-closer-look-at-the-photoshop-generator-syntax.html).

### License

(MIT License)

Copyright (c) 2013 Adobe Systems Incorporated. All rights reserved.
Modifications: Copyright (c) 2013 Renaun Erickson @renaun http://renaun.com

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
