# Project 2 - *Flix*

**Flix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User sees an app icon on the home screen and a styled launch screen.
- [X] User can view a list of movies currently playing in theaters from The Movie Database.
- [X] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [X] User sees a loading state while waiting for the movies API.
- [X] User can pull to refresh the movie list.
- [X] User sees an error message when there's a networking error.
- [X] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

The following **optional** features are implemented:

- [ ] User can tap a poster in the collection view to see a detail screen of that movie
- [ ] User can search for a movie.
- [ ] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the selection effect of the cell.
- [ ] Customize the navigation bar.
- [ ] Customize the UI.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Different ways to implemented the search feature
2. Resources for designing a better UI in the storyboard

## Video Walkthrough

Here's a walkthrough of implemented user stories:

1. App icon and launch screen
<img src='https://imgur.com/a/ZReQE7w' title='App Icon and Launch Screen' width='' alt='App Icon and Launch Screen' />

2. List of movies with poster images, title and overview
<img src='https://imgur.com/a/urDon5c' title= 'List of Movies' width='' alt='List of Movies' />

3. Pull to refresh
<img src='https://imgur.com/a/5EjWgZq.gif' title='Refresh' width='' alt='Refresh' />

4. Details view on tap
<img src='https://imgur.com/a/XhLLtCA.gif' title='Details View' width='' alt='Details View' />

5. Loading indicator
<img src='https://imgur.com/a/69Rxuh9.gif' title='Loading Indicator' width='' alt='Loading Indicator' />

6. Error message activated by network error
<img src='https://imgur.com/a/g5hhb5b.gif' title='Error Message' width='' alt='Error Message' />

7. Tab bar button to collection view
<img src='https://imgur.com/a/FlZhtCh.gif' title='Tab Bar' width='' alt='Tab Bar' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

1. An issue arose while implementing the alert. The try again button was not tappable and the function would not be called. The app didn't crash nor was there an error message. After restarting the simulator and Xcode, the button was functional once again.
2. A warning came up with the alert that I decided to take care of. After adding the alert, making it appear would cause "Presenting view controllers on detached view controllers is discouraged." to be logged in the console. The issue came up because the alert was called by a method that was called in the viewDidLoad method. To resolve this warning, the method call was moved to the viewDidAppear method. The reason this fixed the issue is that the view controller must appear first before more views (such as the alert) appear.

## Credits
- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright 2020 David Lara

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
