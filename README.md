# Petgram

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
<!--4. [Schema](#Schema)-->
4. [Progress](#Progress)

## Overview
### Description
**Petgram** connects pets and pet lovers with other owners and pets everywhere. Pet owners share photos and videos of their pets with their friends, family, and others. Pets connect with each other through live video and direct messaging. Pet owners also connect with pet-related brands through a marketplace for small businesses to sell their products and services. Pets also engage in competitions with other pets to earn awards.

### App Evaluation
- **Category:** Social Media
- **Mobile:** iOS, Android, Web
- **Story:**
    - Pet owners and lovers can share photos and videos of their pets and view others' posts.
    - Pets can join active live video chats to connect with other pets around the world.
    - Small businesses can sell pet products and services through the marketplace.
    - Pets and pet owners can also compete and vote in daily or weekly competitions such as Best Talented or Best Groomed.
- **Market:** Pets and pet owners
- **Habit:** Daily or weekly
- **Scope:** See the [Product Spec](#Product-Spec) for Petgram's minimum viable product (MVP) goals and future goals.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Pet owners create an account for themselves and their pets they will use to sign in to Petgram and use Petgram's features.
* Users view others' posts.
* Users share photos and videos of their pets.
* Users view pets' profile pages.
* Users can access their account settings (such as signing out or updating their profile information).

**Optional Nice-to-have Stories**

* Pets and pet owners compete and vote in daily or weekly competitions such as Best Talented or Best Groomed.
* Small businesses sell pet products and services through the marketplace.
* Pets join active live video chats to connect with other pets around the world.

### 2. Screen Archetypes (for Required stories)

* Authentication
   * Pet owners create an account for themselves and their pets they will use to sign in to Petgram and use Petgram's features.
       * When the app is first opened, Petgram will navigate to the main Authentication screen.
       * If a user creates an account, they will remain signed in until they sign out of their account.
       * When a user is signed out, a user can sign in with an existing account or create a new account.
       * When a user creates an account or signs in with one, Petgram will navigate to the Home view where users can see others' posts.
* Home
   * Users view other posts of pets.
       * Users can tap on a pet's name above the photo or video of a post to view the pet's profile page.
       * Users can like posts.
* Create Post
    * Users can upload a photo or 3-second video of their pets with a caption.
* Profile
    * Users can view their own account's profile or others' profiles.
        * A pet's profile page will contain their profile photo, name, their owner's name, the pet's age, date of birth, kind, breed, talents and awards, where they are in the world, and their posts.
        * Users can tap on a post on the profile page to view the post individually.
* Settings
    * Users can edit their profile information.
    * Users can sign out of their accounts.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Competitions
* Create Post
* Marketplace
* Live and Messages

**Flow Navigation (for Required stories)** (Screen to Screen)

* Authentication
   * Sign in → Home
   * Create an account → onboarding screens → Home
* Home
   * Scroll
   * Tap a post's profile name → creator's profile page
   * In navigation bar:
       * Settings icon → Settings
       * Account icon → user's pet profile
* Create Post
    * Tap Create Post icon in tab bar → Create Post and PHPicker → tap Post button → Home
* Profile
    * Tap post → show individual post
* Settings
    * Tap Sign Out → Authentication

## Wireframes
<img src="https://i.imgur.com/5odY3ca.jpg" width=600>

Made with Figma.

<!--
## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
-->

## Progress
### Week 1 end
- The implementation of the Authentication and Profile storyboards is almost complete. Writing the logic for these pages has started.

### Week 2 end
- The implementation of the Authentication and Profile storyboards is complete. The logic for these pages is almost complete.
- The implementation of the Home and Create Post design and logic is complete.
- Only the Settings screen remains to be completely implemented.
- (Meet all MVP goals by Friday, April 28, 2023 (Week 3 end))
