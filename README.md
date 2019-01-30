# SPHTech


A simple app to show SPH mobile data volume yearly.


We'll are using the most viewed section of this API. 
https://data.gov.sg/api/action/datastore_search?resource_id={resource_id}


We used MVVM Design pattern and swift generic approach to develop this application.

We are generating TestCase and Coverage report using following tools:
* **Fastlane + Slather TestCase and Coverage reports.**

&nbsp; 

## Tools And Resources Used

- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.
- [fastlane](https://docs.fastlane.tools/) - The easiest way to automate building and releasing your iOS and Android apps.
- [Slather](https://github.com/SlatherOrg/slather) - Generate test coverage reports for Xcode projects.


## Library Used
Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.
- [ReachabilitySwift ](https://github.com/ashleymills/Reachability.swift) - Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.


# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Incase of build fail due to dependency ReachabilitySwift, install ReachabilitySwift using CocoaPods.
* Press run icon in Xcode or command + R to run the project on Simulator

&nbsp; 

## Fastlane

Fastlane is for generating TestCase success and code coverage reports using slather

#### Installation

* Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install

```

* Install fastlane using  *gem install fastlane*

* For fastlane test coverage report install slather 
* Install slather  using  `gem install slather`

&nbsp; 

### # Fastlane + Slather Test Code Coverage Report : 87.10% 
* Run using Terminal
* Goto project directory $ cd project_directory_path
* Run command  `fastlane codecoverage` to get the code coverage.

```
cd ProjectDir/SPHTech
fastlane codecoverage

```
* Coverage report will be found under path `projectDir/SPHTech/fastlane/test_output/coverage/index.html`
* TestCase success report will be found under path `projectDir/SPHTech/fastlane/test_output/report.html`

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/2651087/51989942-0955ed80-24ce-11e9-92b7-df13b17a8ab6.png" width="80%" height="80%">
</kbd>

&nbsp; 
&nbsp; 


<kbd >
<img src="https://user-images.githubusercontent.com/2651087/51990194-8c774380-24ce-11e9-8869-365a336520bd.png" width="80%" height="80%">
</kbd>

&nbsp; 
&nbsp; 

## Running The Tests Manually 

Follow the steps to get test case reports:
* Enable coverage Data under test schema section:
* Select the Test Icon by pressing and holding Xcode Run Icon OR press `Command+Control+U`
* In the Project Navigator under Test Navigator tab, check test status and coverage 

# Architecture

We used MVVM :

&nbsp; 
&nbsp; 

<kbd >
<img src="https://user-images.githubusercontent.com/15336778/41942613-a4008032-79bd-11e8-98b5-a40e7d871203.png" width="80%" height="80%">
</kbd>

</br>
</br>

# MIT License

Copyright 2019

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

