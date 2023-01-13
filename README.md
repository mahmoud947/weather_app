# Weather APP

https://user-images.githubusercontent.com/65209396/212238981-284d5d52-04be-42f5-802f-d8fbc0a105ed.mp4

## RXdart

![architecture](./art/rxdart.png?raw=true)

Dart streams were developed with reactive programming in mind, Instead of providing an alternative to it, RxDart adds additional functionality using the reactive approach on top of it.

In Dart, if we’ve to send data, error and done events to its stream we use StreamController but, in RxDart we have to use Subject which is the same as StreamController but with additional stuff.

all the subjects of RxDart is similar to broadcast StreamController which means we can listened to the subject’s stream as many time as we want.

BehaviorSubject
In BehaviorSubject the most recent item that we added to our subject is dispatched to it’s new listeners. When we listen to our new listener it will receive the latest stored item from the subject and after that new event will be sent to all other listeners. let’s see with example,

## Flutter Clean Architecture Implementation

This is app implementation base on an clean architecture that makes it easy and intuitive to implement Architecture in Flutter.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```https://github.com/mahmoud947/weather_app.git```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```flutter pub get```

## Architecture Overview

![architecture](./art/arch1.png?raw=true)

As described in Uncle Bob's webpage, clean architecture enforces the separations of concerns dividing the software into layers. Each one of these layers focuses on doing one single thing, so it follows the Single Responsibility Principle. They also have their own Model representations and any communication needed with external layers are made through the use of abstractions.

The architecture also follows the Dependency Rule, which states that an outer layer can depend on an inner layer, but the other way around is not possible. As result, the application becomes highly decoupled, easy to maintain, to test and to adapt.

## Known limitations

- The initial set up involves dealing with some boilerplate code

### Known benefits

- A/B testing can be applied easily, and it will touch only one layer (the Presentation Layer).
- Feature toggle can be used easily, both to enable/disable features or to try out new ideas (without needing to release a new version).
- All layers can be unit tested independently.
- Unidirectional data flow makes it easy to understand the code.
- We can use different State Managements libraries (Provider, BLOC, States Rebuilder, State Notifier...) on the Presentation layer, or even try out new ones easily if needed
  
## Details

![architecture](./art/arch2.png?raw=true)

### MobileUI

### Presentation

The application user interface. It depends on the Flutter Framework containing classes responsible for:

- Build the UI: like ``Widgets``, ``BuildContexts``, and others.
- Hold the Presentation logic: ``ChangeNotifier``, ``BLOC``, ``ViewModels``, and others.

The presentation logic will receive data from the Domain's use cases, and then it will prepare these data to be presented on the UI. In general, it is the recommended place to format/internationalize things. For example, it can receive from the Domain a ``DateTime`` object with the format ``"1969-07-20 20:18:04Z"`` and prepare/format this data to be presented on the UI according to the user's device language.

### Domain

It represents the domain of the problem we are trying to solve, that is, your business rules. It is the architecture's central layer, therefore, it has no dependencies on external layers and should be a plain dart module. It includes:

- plain entity classes (like ``Character`` entity)
- usecase classes, that encapsulate all the business logic related to a particular usecase (like ``GetAllCharacters``, ``SignInUser``, and others...)
- data access abstractions (Repository Interfaces)
  
A use-case has no clue if the data it'll receive comes from a memory cache, local storage, or the internet. All these details were abstract out by the use of the Repositories' Interfaces, and from the use-case point of view, all that matters is that it'll receive its data.

### Data

It is the layer that implements the data access abstractions (Repository Interfaces) defined into the domain. In other words, it is the layer responsible for providing data to those use cases. It is "the brain" that knows how/when to fetch data from the network or local cache, and how/when to cache things. It includes:

- It is the Implementations of repositories defined by domain layer
- It'll hold/manage any in memory caches
- It'll define Data-source abstractions (like ``RemoteDatasourceInterface``, ``LocalCacheDatasourceInterface``)
  
It works like a "boundary" between our application and the external world in a certain way. It will "translate" how things are "fetched" from/to the internet, or "loaded" from/to the database, to how these same things are represented in our Domain.

### Network

Layer responsible for handle the communication to the network. It has the implementation of the remote abstraction (``RemoteDatasourceInterface``) defined into the Data layer:

- We define the endpoints we are going to use
- We configure any interceptors we need
- We serialize/deserialize the JSON to Data objects

It represents a "boundary" with the external world. We are translating the "language" our API uses to communicate (JSON) to something that we can understand and work better (Data object).

### Local

This layer provides access to any kind of local storage: database, shared preferences, files, and others. It implements the abstractions (``LocalCacheDatasourceInterface``) defined into the Data layer.

It represents a "boundary" with the inner world. I mean, how we store things in our local device. We can use shared-preferences' key-values, serialize/deserialize things into files, read/write from the database, etc.

The point is: Each method has its way to "save" and "read" things, and this layer will translate this way to objects that our Data Layer knows how to handle.

## References

- [Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the (Weather Aap) then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectures for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
