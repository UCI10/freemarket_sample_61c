# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false, unique: true|
|BirthYear|string|null: false|
|BirthMonth|string|null: false|
|BirthDay|string|null: false|
|Firstname|string|null: false|
|Lastname|string|null: false|
|FirstNamePhonetic|string|null: false|
|LasttNamePhonetic|string|null: false|
|Prefecture|string|null: false|
|PostalCode|integer|null: false|
|City|string|null: false|
|HouseNumber|string|null: false|
|BuildingName|string||
|PhoneNumber|integer|null: false|
|avatar|string||
<!-- |review_id|references||
|item_id|references|| -->




### Association


