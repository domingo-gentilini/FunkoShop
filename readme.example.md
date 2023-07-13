# Appartamentos NC API Documentation

This project is part of No Country emulation process ...

1. Navigate to the directory where the repository was downloaded
``` bash
cd api
```
2. Install the required dependencies
``` bash
npm install
```
3. Configure API

	i. Locate the file named `.env.example` in the main /api folder.

	ii. Create a copy of this file, called `.env` by removing the `example` extension.

	iii. Open the `.env` file in a text editor.


## Authentication

Open endpoints require no Authentication.

* [Login](login.md) : `POST /api/login`

# Login

Used to collect a Token for a registered User.

**URL** : `/api/login`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
    "email": "[valid email address]",
    "password": "[password in plain text]"
}
```

**Data example**

```json
{
    "username": "mail@example.com",
    "password": "Abc*d1234"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "tokenGenerated": "93144b288eb1fdccbe46d6fc0f241a51766ecd3d"
}
```

## Error Response

**Condition** : If 'username' and 'password' combination is wrong.

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "non_field_errors": [
        "Unable to login with provided credentials."
    ]
}
```

* [Register](login.md) : `POST api/create`

# Register

Used to register a new user.

**URL** : `/api/create`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
	"name": "[valid name]",
	"lastName": "[valid lastname]",
	"email": "[valid email address]",
	"dateOfBirth": "[valid date]",
	"password": "[valid plain text password]"
}
```

**Data example**

```json
{
	"name": "Abelardo",
	"lastName": "Martinez",
	"email": "mail@example.com",
	"dateOfBirth": "1992/08/21",
	"password": "Abc*d1234"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
	"name": "Abelardo",
	"lastName": "Martinez",
	"email": "amartinez@gmail.com",
	"role": [
		"user"
	],
	"status": "active",
	"isBarber": false,   /*preguntar este item*/
	"_id": "6438cb33d072af368825960e",
	"createdAt": "2023-04-14T03:40:35.226Z",
	"updatedAt": "2023-04-14T03:40:35.226Z"
}
```

## Error Response

**Condition** : If 'username' and 'password' combination is wrong.

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "non_field_errors": [
        "Unable to login with provided credentials."
    ]
}
```

## Endpoints that require Authentication

Closed endpoints require a valid Token to be included in the header of the
request. A Token can be acquired from the Login view above.

To authenticate you need to add a token like this:


### Users

Each endpoint manipulates or displays information related to the User whose
Token is provided with the request:

* [Me](user/get.md) : `GET /api/v1/auth/me`

# Show Current User Info

Get the details of the currently Authenticated User along with basic
subscription information.

**URL** : `/api/v1/auth/me`

**Method** : `GET`

**Auth required** : YES

**Header** : x-access-token

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

```json
{
	"_id": "643273b3a5ae2815da879f25",
	"name": "Pedro",
	"lastName": "Porro",
	"email": "pporro12@gmail.com",
	"password": "$2b$10$fxMnMneNfj2dfcFzryXU..jMKVGIIAmPsfZqN6GnIetUQZlO7E3xq",
	"homeAddress": "Lancaster 652",
	"age": 39,
	"role": [
		"admin"
	],
	"status": "active",
	"isBarber": false,
	"createdAt": "2023-04-09T08:13:39.195Z",
	"updatedAt": "2023-04-09T08:13:39.195Z"
}
```

* [Get an User](user/get.md) : `GET /api/v1/users/:id`

# Show Current User Info

Get the details of the currently Authenticated User along with basic
subscription information.

**URL** : `/api/v1/users/:id`

**Method** : `GET`

**Auth required** : YES

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

```json
{
	"result": {
		"_id": "64327380a5ae2815da879f22",
		"name": "Pedro",
		"lastName": "Porro",
		"email": "miemail@gmail.com",
		"password": "123456",
		"homeAddress": "Lancaster 652",
		"age": 48,
		"role": [
			"user"
		],
		"status": "active",
		"isBarber": false,
		"createdAt": "2023-04-09T08:12:48.496Z",
		"updatedAt": "2023-04-09T16:56:01.426Z",
		"dateOfBirth": "1999/09/19"
	}
}
```

* [List all Users](user/get.md) : `GET /api/v1/users/:id`

# List users

Get the list of users .

**URL** : `/api/v1/users/`

**Method** : `GET`

**Auth required** : YES

**Header** : x-access-token

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

```json

	{
		"_id": "64327380a5ae2815da879f22",
		"name": "Pedro",
		"lastName": "Porro",
		"email": "miemail@gmail.com",
		"password": "123456",
		"homeAddress": "Lancaster 652",
		"age": 48,
		"role": [
			"user"
		],
		"status": "active",
		"isBarber": false,
		"createdAt": "2023-04-09T08:12:48.496Z",
		"updatedAt": "2023-04-09T16:56:01.426Z",
		"dateOfBirth": "1999/09/19"
	},
	{
		"_id": "643273b3a5ae2815da879f25",
		"name": "Pedro",
		"lastName": "Porro",
		"email": "pporro12@gmail.com",
		"password": "$2b$10$fxMnMneNfj2dfcFzryXU..jMKVGIIAmPsfZqN6GnIetUQZlO7E3xq",
		"homeAddress": "Lancaster 652",
		"age": 39,
		"role": [
			"admin"
		],
		"status": "active",
		"isBarber": false,
		"createdAt": "2023-04-09T08:13:39.195Z",
		"updatedAt": "2023-04-09T08:13:39.195Z"
	},
	{
		"_id": "6432f2e57394e81b51fe8033",
		"name": "Paul",
		"lastName": "Godrick",
		"email": "pgodrick@gmail.com",
		"password": "$2b$10$BBYD0N.6fC6IFNQcKkwnj.wHB4rRiUkifLuDcFNnqq2bcq0o04Ktu",
		"homeAddress": "Chesterfueld 122",
		"age": 26,
		"role": [
			"user"
		],
		"status": "active",
		"isBarber": true,
		"createdAt": "2023-04-09T17:16:21.917Z",
		"updatedAt": "2023-04-09T17:16:21.917Z"
	},
	{
		"_id": "6432f3637394e81b51fe8036",
		"name": "Victor",
		"lastName": "Esparza",
		"email": "vesparza@gmail.com",
		"password": "$2b$10$SQ.LmsihSpgX4tbMPLZyPeMM74I9JYGY3zXlDBRd3nQfS4QNMLEEm",
		"homeAddress": "Neterfield 989",
		"age": 24,
		"role": [
			"user"
		],
		"status": "active",
		"isBarber": true,
		"createdAt": "2023-04-09T17:18:27.241Z",
		"updatedAt": "2023-04-09T17:18:27.241Z"
	}
]
```

* [Update an User](user/put.md) : `PATCH /api/v1/users/:id`

# Update Current User info

Allow the Authenticated User to update their details.

**URL** : `/api/v1/users/:id`

**Method** : `PATCH`

**Auth required** : YES

**Header**: x-access-token

**Permissions required** : None

**Data constraints**

```json
{
	"name": "Pedro",
	"lastName": "Porro",
	"dateOfBirth": "1999/09/19",
	"password": "123456"
}
```

Note that `id` and `email` are currently read only fields.

**Data examples**

Partial data is allowed.

```json
{
    "name": "John"
}
```

## Success Responses

**Condition** : Data provided is valid and User is Authenticated.

**Code** : `200 OK`

**Content example** :

```json
{
	"_id": "64327380a5ae2815da879f22",
	"name": "Pedro",
	"lastName": "Porro",
	"email": "miemail@gmail.com",
	"password": "123456",
	"homeAddress": "Lancaster 652",
	"age": 48,
	"role": [
		"user"
	],
	"status": "active",
	"isBarber": false,
	"createdAt": "2023-04-09T08:12:48.496Z",
	"updatedAt": "2023-04-09T16:56:01.426Z",
	"dateOfBirth": "1999/09/19"
}
```

## Error Response

**Condition** : If provided data is invalid, e.g. a name field is too long.

**Code** : `400 BAD REQUEST`

**Content example** :

```json
{
    "first_name": [
        "Please provide maximum 30 character or empty string",
    ]
}
```

## Notes

* Endpoint will ignore irrelevant and read-only data such as parameters that
  don't exist, or fields that are not editable like `id` or `email`.
* Similar to the `GET` endpoint for the User, if the User does not have a
  UserInfo instance, then one will be created for them.

### Products

Endpoints for viewing and manipulating products that the Authenticated User
has permissions to access.

* [List Products](accounts/get.md) : `GET /api/products/`

# List products

Get the list of users .

**URL** : `/api/v1/products/`

**Method** : `GET`

**Auth required** : YES

**Header** : x-access-token

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

```json

[
	{
		"_id": "6432f0de3413339193948ee8",
		"name": "Beard Shampoo Black EL TURCO",
		"description": "SHAMPOO ARTESANAL PARA BARBA BLACK EL TURCO",
		"price": 40,
		"__v": 0
	},
	{
		"_id": "6432f0fb3413339193948eea",
		"name": "Beard Oil GROWTH - El Turco",
		"description": "ACEITE PARA BARBA GROWTH EL TURCO",
		"price": 95,
		"__v": 0
	},
	{
		"_id": "6432f13b3413339193948eec",
		"name": "BEARD SHIELD – Protector de Barba",
		"description": "Diseñado para no maltratar la barba como las mascarillas normales",
		"price": 49,
		"__v": 0
	}
]
```

* [Create a Product](accounts/post.md) : `POST /api/v1/products/`

Used to register a new product to offer.

**URL** : `/api/v1/products/`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
	"name": "[valid name]",
	"description": "[valid text plain description of a product]",
	"price": "[valid price amount that includes decimals]"
}
```

**Data example**

```json
{
	"name": "BEARD SHIELD – Protector de Barba",
	"description": "Diseñado para no maltratar la barba como las mascarillas normales",
	"price": 49
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
	"name": "BEARD SHIELD – Protector de Barba",
	"description": "Diseñado para no maltratar la barba como las mascarillas normales",
	"price": 49,
	"_id": "6432f13b3413339193948eec",
	"__v": 0
}
```

## Error Response

**Condition** : If 'username' and 'password' combination is wrong.

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "non_field_errors": [
        "Unable to login with provided credentials."
    ]
}
```
* [Get an Product](user/get.md) : `GET /api/v1/products/:id`

# Show a product

Get the details of the currently Authenticated User along with basic
subscription information.

**URL** : `/api/v1/products/:id`

**Method** : `GET`

**Auth required** : YES

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

```json
{
	"result": {
		"_id": "6432f0fb3413339193948eea",
		"name": "Beard Shampoo Regular EL TURCO",
		"description": "SHAMPOO ARTESANAL PARA BARBA REGULAR EL TURCO",
		"price": 40,
		"__v": 0
	}
}
```

## Notes

* Endpoint will ignore irrelevant and read-only data such as parameters that
  don't exist, or fields that are not editable like `id` or `email`.
* Similar to the `GET` endpoint for the User, if the User does not have a
  UserInfo instance, then one will be created for them.

* [Update a Product](accounts/pk/put.md) : `PATCH /api/v1/products/:id`

# Update Product Info

Allow the Authenticated User as admin to update product info.

**URL** : `/api/v1/users/:id`

**Method** : `PATCH`

**Auth required** : YES

**Header**: x-access-token

**Permissions required** : None

**Data constraints**

```json
{
	"name": "Beard Oil GROWTH - El Turco",
	"description": "ACEITE PARA BARBA GROWTH EL TURCO",
	"price": 95
}
```

**Data examples**

Partial data is allowed.

```json
{
	"price": 95
}
```

## Success Responses

**Condition** : Data provided is valid and User is Authenticated.

**Code** : `200 OK`

**Content example** :

```json
{
	"_id": "6432f0fb3413339193948eea",
	"name": "Beard Oil GROWTH - El Turco",
	"description": "ACEITE PARA BARBA GROWTH EL TURCO",
	"price": 95,
	"__v": 0
}
```

## Error Response

**Condition** : If provided data is invalid, e.g. a name field is too long.

**Code** : `400 BAD REQUEST`

**Content example** :

```json
{
    "first_name": [
        "Please provide maximum 30 character or empty string",
    ]
}
```

* [Delete a Product](accounts/pk/delete.md) : `DELETE /api/v1/products/:id`



### Services

Endpoints for viewing and manipulating the services which store can offer, user must be Authenticated has permissions to access.

* [List Services](accounts/get.md) : `GET /api/services/`

# List services

Get the list of users .

**URL** : `/api/v1/services/`

**Method** : `GET`

**Auth required** : YES

**Header** : x-access-token

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

```json

[
	{
		"_id": "6432f1db3413339193948ef1",
		"name": "Arreglo de Barba",
		"price": 50,
		"description": "Arreglo de barba, corte y perfilado, toalla caliente y aplicacion de aceites y ceras para la barba",
		"__v": 0
	},
	{
		"_id": "6432f25b7394e81b51fe802d",
		"name": "Corte de Cabello",
		"price": 60,
		"description": "Corte de cabello a tijera y maquinas, lavado de cabello y aplicacion de productos",
		"__v": 0
	},
	{
		"_id": "6432f2737394e81b51fe802f",
		"name": "Corte de Cabello y Arreglo de Barba",
		"price": 90,
		"description": "Corte de cabello corte a tijera y maquinas, lavado de cabeza y aplicacion de productos / arreglo de barba , corte, perfilado toalla",
		"__v": 0
	}
]
```

* [Create a Service](accounts/post.md) : `POST /api/v1/services/`

Used to register a new product to offer.

**URL** : `/api/v1/services/`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
	"name": "[valid name]",
	"price": "[valid price amount that includes decimals]",
    "description": "[valid text plain description of a service]",
}
```

**Data example**

```json
{
	"name": "Corte de Cabello y Arreglo de Barba",
	"price": 90,
	"description": "Corte de cabello corte a tijera y maquinas, lavado de cabeza y aplicacion de productos / arreglo de barba , corte, perfilado toalla"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
	"name": "Corte de Cabello y Arreglo de Barba",
	"price": 90,
	"description": "Corte de cabello corte a tijera y maquinas, lavado de cabeza y aplicacion de productos / arreglo de barba , corte, perfilado toalla",
	"_id": "6432f2737394e81b51fe802f",
	"__v": 0
}
```

## Error Response

**Condition** : If 'username' and 'password' combination is wrong.

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "non_field_errors": [
        "Unable to login with provided credentials."
    ]
}
```

* [Get a Service](user/get.md) : `GET /api/v1/services/:id`

# Show a service

Get the details of a service

**URL** : `/api/v1/services/:id`

**Method** : `GET`

**Auth required** : YES

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

```json
{
	"result": {
		"_id": "6432f2737394e81b51fe802f",
		"name": "Corte de Cabello y Arreglo de Barba",
		"price": 90,
		"description": "Corte de cabello corte a tijera y maquinas, lavado de cabeza y aplicacion de productos / arreglo de barba , corte, perfilado toalla",
		"__v": 0
	}
}
```

* [Update a Service](accounts/pk/put.md) : `PATCH /api/v1/services/:id`


# Update service info

Allow the Authenticated User as admin to update product info.

**URL** : `/api/v1/services/:id`

**Method** : `PATCH`

**Auth required** : YES

**Header**: x-access-token

**Permissions required** : None

**Data constraints**

```json
{
	"name": "Corte de Cabello y Arreglo de Barba",
	"price": 115,
	"description": "Corte de cabello corte a tijera y maquinas, lavado de cabeza y aplicacion de productos / arreglo de barba , corte, perfilado toalla"
}
```

**Data examples**

Partial data is allowed.

```json
{
	"price": 135,
}
```

## Success Responses

**Condition** : Data provided is valid and User is Authenticated.

**Code** : `200 OK`

**Content example** :

```json
{
	"_id": "6432f2737394e81b51fe802f",
	"name": "Corte de Cabello y Arreglo de Barba",
	"price": 121,
	"description": "Corte de cabello corte a tijera y maquinas, lavado de cabeza y aplicacion de productos / arreglo de barba , corte, perfilado toalla",
	"__v": 0
}
```

## Error Response

**Condition** : If provided data is invalid, e.g. a name field is too long.

**Code** : `400 BAD REQUEST`

**Content example** :

```json
{
    "first_name": [
        "Please provide maximum 30 character or empty string",
    ]
}
```


* [Delete a Service](accounts/pk/delete.md) : `DELETE /api/v1/services/:id`

### Bookings

Endpoints for viewing and manipulating the bookings that the Authenticated User
has permissions to access.

* [List Bookings](accounts/get.md) : `GET /api/bookings/`

# List Bookings

Get the list of users .

**URL** : `/api/v1/bookings/`

**Method** : `GET`

**Auth required** : YES

**Header** : x-access-token

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

```json

[
	{
		"_id": "6438cd9fd072af3688259614",
		"user": "643273b3a5ae2815da879f25",
		"barber": "6432f3637394e81b51fe8036",
		"date": "2023-04-12T16:00:00.000Z",
		"service": "6432f2737394e81b51fe802f",
		"product": "6432f0fb3413339193948eea",
		"__v": 0
	},
	{
		"_id": "6438ce34d072af3688259617",
		"user": "64327380a5ae2815da879f22",
		"barber": "6432f3637394e81b51fe8036",
		"date": "2023-04-12T16:00:00.000Z",
		"service": "6432f2737394e81b51fe802f",
		"product": "6432f0fb3413339193948eea",
		"__v": 0
	},
	{
		"_id": "6438d00fd072af368825961a",
		"user": "64327380a5ae2815da879f22",
		"barber": "6432f3637394e81b51fe8036",
		"date": "2023-04-12T16:00:00.000Z",
		"service": "6432f25b7394e81b51fe802d",
		"product": "6432f0de3413339193948ee8",
		"__v": 0
	}
]
```

* [Create a Booking](accounts/post.md) : `POST /api/v1/bookings/`

Used to register a booking.

**URL** : `/api/v1/bookings/`

**Method** : `POST`

**Auth required** : `YES`

**Data constraints**

```json
{
	"user": "[valid client id]",
	"barber": "[valid barber id]",
	"date": "[valid date]",
	"service": "[valid service id]",
	"product": "[valid product id]"
}
```

**Data example**

```json
{
	"user": "64327380a5ae2815da879f22",
	"barber": "6432f3637394e81b51fe8036",
	"date": "2023-04-23T16:00:00.000+00:00",
	"service": "6432f25b7394e81b51fe802d",
	"product": "6432f0de3413339193948ee8"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
	"user": "64327380a5ae2815da879f22",
	"barber": "6432f3637394e81b51fe8036",
	"date": "2023-04-23T16:00:00.000Z",
	"service": "6432f25b7394e81b51fe802d",
	"product": "6432f0de3413339193948ee8",
	"_id": "643b902e8ed9a25ac3f32d9b",
	"__v": 0
}
```

## Error Response

**Condition** : If 'username' and 'password' combination is wrong.

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "non_field_errors": [
        "Unable to login with provided credentials."
    ]
}
```

* [Show a Booking Detail](accounts/pk/get.md) : `GET /api/v1/bookings/:id`

# Show a booking detail

Get the details of a service

**URL** : `/api/v1/booking/:id`

**Method** : `GET`

**Auth required** : YES

**Permissions required** : None

## Success Response

**Code** : `200 OK`

**Content examples**

```json
{
	"result": {
		"_id": "6432fe4d66f89333648b13b8",
		"user": "643273b3a5ae2815da879f25",
		"barber": "6432f3637394e81b51fe8036",
		"date": "2023-04-12T16:00:00.000Z",
		"service": {
			"_id": "6432f2737394e81b51fe802f",
			"name": "Corte de Cabello y Arreglo de Barba",
			"price": 90,
			"description": "Corte de cabello corte a tijera y maquinas, lavado de cabeza y aplicacion de productos / arreglo de barba , corte, perfilado toalla",
			"__v": 0
		},
		"product": {
			"_id": "6432f0fb3413339193948eea",
			"name": "Beard Oil GROWTH - El Turco",
			"description": "ACEITE PARA BARBA GROWTH EL TURCO",
			"price": 95,
			"__v": 0
		},
		"__v": 0
	}
}
```

* [Update a Booking](accounts/pk/put.md) : `PATCH /api/v1/bookings/:id`

Allow the Authenticated User as admin to update booking info.

**URL** : `/api/v1/services/:id`

**Method** : `PATCH`

**Auth required** : YES

**Header**: x-access-token

**Permissions required** : YES

**Data constraints**

```json
{
	"user": "[valid client id]",
	"barber": "[valid barber user id]",
	"date": "[valid date]",
	"service": "[valid service id]",
	"product": "[valid product id]"
}
```

**Data examples**

Partial data is allowed.

```json
{
	"date": "2023/04/15",
}
```

## Success Responses

**Condition** : Data provided is valid and User is Authenticated.

**Code** : `200 OK`

**Content example** :

```json
{
	"_id": "6438d00fd072af368825961a",
	"user": "64327380a5ae2815da879f22",
	"barber": "6432f3637394e81b51fe8036",
	"date": "2023-08-12T16:00:00.000Z",
	"service": "6432f25b7394e81b51fe802d",
	"product": "6432f0de3413339193948ee8",
	"__v": 0
}
```

## Error Response

**Condition** : If provided data is invalid, e.g. a name field is too long.

**Code** : `400 BAD REQUEST`

**Content example** :

```json
{
    "first_name": [
        "Please provide maximum 30 character or empty string",
    ]
}
```

* [Delete a Booking](accounts/pk/delete.md) : `DELETE /api/v1/bookings/:id`

# ----------------------------------------------------------------------------------------
