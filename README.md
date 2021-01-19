ArtiCle
=======

Expand the circle of artists

## Description
You can post your favorite artists and chat between users

## Test account
You can login by pressing the guest user

## Usage

### How to post
1. Login
2. Click "New Post"
3. Select and post your favorite artists, genres, and favorite images

### How to edit my page
1. Login
2. Click user name
3. Click "Edit user"
4. You can change nickname, profile, generation, gender, and place of residence

## Demo

## Aimed problem solving
- It is a site created to solve the problem that people who like music want to expand the range of their favorite music.
- By gathering users who like the same artist, I thought that I could efficiently meet the artists I like.

## Identified requirements
| Priority | Function           | Purpose                                        | Details                                                         | Use Case                                                                                           | Time |
|----------|--------------------|------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------- |------|
| 3        | Top screen display | To provide instructions on how to use the site | Simplify login method using guest user function                 | You can check how to use the site                                                                  | 6    |
| 3        | User management    | Manage users                                   | Create using device                                             | You can register or log in                                                                         | 6    |
|          |                    |                                                | Create a user's My Page                                         | You can view and manage your photos, nickname, profile, prefecture and favorite artists on My Page |      |
|          |                    |                                                | To make it available only to registered users                   |                                                                                                    |      |
|          |                    |                                                | To allow the site to be viewed only while the user is logged in |                                                                                                    |      |
| 3        | Artist list        | Display the artist ranking                     | Display artist rankings by general and genre                    | You can browse artist rankings and posted artists                                                  | 15   |
|          |                    | View posted artists                            | Show posted artists                                             |                                                                                                    |      |
| 3        | Chat creation      | Post favorite artists to create a chat room    | You can chat by posting your favorite artist                    | You can chat for each artist posted                                                                | 6    |
| 3        | Message sending    | Conversation between users in a chat room      | You can chat for each artist                                    | You can join the chat of any artist                                                                |      |
|          |                    |                                                | You can save the artist to your favorites                       | You can register the artist as a favorite                                                          |      |
| 3        | Chat editing       | Edit chat name and image                       | Only the person who created the chat can edit it                | You can edit the chat name and image created only by the artist's poster                           | 6    |
| 3        | Chat delete        | Delete the created chat                        | Only the person who created the chat can be deleted             | You can delete chats created only by the artist's poster                                           | 6    |
| 3        | Artist search      | Search for posted artists                      | Ambiguous search                                                | You can search for artists posted by artist name or genre                                          | 6    |
|          |                    |                                                | Search by genre                                                 |                                                                                                    |      |
| 3        | Favorite           | Add an artist to your favorites                | Display your favorite artists on My Page                        | Display it on My Page by registering your favorite artist as a favorite                            | 10   |
|          |                    |                                                | Display the ranking by the number of favorites                  |                                                                                                    |      |
| 2        | Request            | Hear the user's voice                          | Users can make requests and inquiries when using the site       | You can make inquiries and requests for functions                                                  | 4    |
| 2        | Calendar           | Save the events you attend                     | Users can own a calendar and enter events in My Page            | You can register events in the calendar on the My Page screen                                      | 10   |
| 1        | Comment            | Allow comments for calendar dates              | You can write comments about events registered in the calendar  | You can write comments for events in the calendar on the My Page screen of other users             | 5    |
| 1        | Notification       | Function to notify when commented on My Page   | Notify the user who received the comment                        | You will be notified if there are comments on the calendar in My Page                              | 5    |
| 1        | Follow             | Allow users to follow each other               | You can send DM only when you follow each other                 | You can send DM only when you follow each other                                                    | 10   |


## Description of the implemented features
- User management function

- Artist list function

## Features to be implemented
- Top screen display function
- Chat creation function
- Message sending function
- Chat editing function
- Chat delete function
- Artist search function
- Favorite function
- Request function
- Calendar function
- Comment function
- Notification function
- Follow function

## Database

![Uploading スクリーンショット 2021-01-19 21.13.37.png…]()

## Install
```
git clone https://github.com/Fuka-Aki/arti_cle.git
```

## environment
- Framework: Ruby on Rails
- Front-end: HTML/CSS/Javascript
- back-end :Ruby(2.6.5)
- Test     : RSpec
- Linter   : Rubocop
- Database : MySQL
- Task     : GitHub

## Author
- https://github.com/Fuka-Aki

