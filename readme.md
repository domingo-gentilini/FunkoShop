# Appartamentos NC API Documentation

Este proyecto es parte de una emulacion No Country...

# Autenticación

Los endpoints no requieren autenticación

* [Login]: `POST /api/login`

# Login

Recopilamos un Token para un usuario registrado.

**URL** : `/api/login`

**Metodo** : `POST`

**Requiere Autenticación** : NO

**Restricciones de Datos**

```json
{	
    "email": "[string formato email]",
    "password": "[string formato password]"
}
```

**Ejemplos de datos**

```json
{
    "username": "mail@example.com",
    "password": "Abc*d1234"
}
```

## Response Exitosa

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

* [Register]: `POST api/create`

# Register

Used to register a new user.

**URL** : `/api/create`

**Metodo** : `POST`

**Requiere Autenticación** : NO

**Restricciones de Datos**

```json
{
	"name": "[string]",
	"lastName": "[string]",
	"email": "[string]",
	"password": "[string]"
}
```

**Ejemplos de datos**

```json
{
	"name": "Abelardo",
	"lastName": "Martinez",
	"email": "mail@example.com",
	"password": "Abc*d1234"
}
```

## Response Exitosa

**Code** : `200 OK`

**Content example**

```json
{
	"name": "Abelardo",
	"lastName": "Martinez",
	"email": "amartinez@gmail.com",
	"is_active": "true",
	"id": "20221218",
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

* [Me]: `GET /api/me`

# Show Current User Info

Get the details of the currently Authenticated User along with basic
subscription information.

**URL** : `/api/me`

**Metodo** : `GET`

**Requiere Autenticación** : YES

**Header** : x-access-token

**Permissions required** : None

## Response Exitosa

**Code** : `200 OK`

**Content examples**

```json
{
	"id": "20221218",
	"name": "Pedro",
	"lastName": "Porro",
	"email": "pporro12@gmail.com",
	"password": "CONtraseñña18122022!!",
	"homeAddress": "Lancaster 652",
	"age": 39,
	"is_active": "true",
	"createdAt": "2023-04-09T08:13:39.195Z",
	"updatedAt": "2023-04-09T08:13:39.195Z"
}
```

* [Get an User] : `GET /api/me`

* [List all Users] : `GET /api/users/list`

# List users

Get the list of users .

**URL** : `/api/users/list/`

**Metodo** : `GET`

**Requiere Autenticación** : YES

**Header** : x-access-token

**Permissions required** : None

## Response Exitosa

**Code** : `200 OK`

**Content examples**

```json
[

	{
		"id": "20221218",
		"name": "Pedro",
		"lastName": "Porro",
		"email": "miemail@gmail.com",
		"password": "CONtraseñña18122022!!",
		"homeAddress": "Lancaster 652",
		"age": 48,
		"is_active": "active",
		"createdAt": "2023-04-09T08:12:48.496Z",
		"updatedAt": "2023-04-09T16:56:01.426Z",
	},
	{
		"id": "20221218",
		"name": "Pedro",
		"lastName": "Porro",
		"email": "pporro12@gmail.com",
		"password": "CONtraseñña18122022!!",
		"homeAddress": "Lancaster 652",
		"age": 39,
		"is_active": "true",
		"createdAt": "2023-04-09T08:13:39.195Z",
		"updatedAt": "2023-04-09T08:13:39.195Z"
	},
	{
		"id": "20221218",
		"name": "Paul",
		"lastName": "Godrick",
		"email": "pgodrick@gmail.com",
		"password": "CONtraseñña18122022!!",
		"homeAddress": "Chesterfueld 122",
		"age": 26,
		"is_active": "true",
		"createdAt": "2023-04-09T17:16:21.917Z",
		"updatedAt": "2023-04-09T17:16:21.917Z"
	},
	{
		"id": "20221218",
		"name": "Victor",
		"lastName": "Esparza",
		"email": "vesparza@gmail.com",
		"password": "CONtraseñña18122022!!",
		"homeAddress": "Neterfield 989",
		"age": 24,
		"is_active": "true",
		"createdAt": "2023-04-09T17:18:27.241Z",
		"updatedAt": "2023-04-09T17:18:27.241Z"
	}
]
```

* [Update an User]: `POST /api/users/update/:id`

# Update Current User info

Allow the Authenticated User to update their details.

**URL** : `/api/users/update/:id`

**Metodo** : `POST`

**Requiere Autenticación** : YES

**Header**: x-access-token

**Permissions required** : None

**Restricciones de Datos**

```json
{
	"name": "String",
	"lastName": "string",
	"password": "string"
}
```

Note that `id` and `email` are currently read only fields.

**Ejemplos de datos**

Partial data is allowed.

```json
{
    "name": "John"
}
```

## Response Exitosa

**Condition** : Data provided is valid and User is Authenticated.

**Code** : `200 OK`

**Content example** :

```json
{
	"id": "20221218",
	"name": "Pedro",
	"lastName": "Porro",
	"email": "miemail@gmail.com",
	"password": "CONtraseñña18122022!!",
	"homeAddress": "Lancaster 652",
	"age": 48,
	"is_active": "true",
	"createdAt": "2023-04-09T08:12:48.496Z",
	"updatedAt": "2023-04-09T16:56:01.426Z",
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

# Delete Current User info

Allow the Authenticated User to delete their details and information.

**URL** : `/api/users/:id`

**Metodo** : `DELETE`

**Requiere Autenticación** : YES

**Header**: x-access-token

**Permissions required** : None

## Response Exitosa

**Code** : `200 OK`

**Content example** :

```json
{
"La cuenta ha sido eliminada."
}
```

## Error Response

**Code** : `400 BAD REQUEST`

**Content example** :

```json
{
    "Ocurrió un error al eliminar la cuenta."
}
``` 

### Properties

Endpoints for viewing and manipulating properties that the Authenticated User
has permissions to access.

* [List Properties] : `GET /api/properties/list`

# List properties

Get the list of properties .

**URL** : `/api/properties/list`

**Metodo** : `GET`

**Requiere Autenticación** : YES

**Header** : x-access-token

**Permissions required** : None

## Response Exitosa

**Code** : `200 OK`

**Content examples**

```json

[
	{
		"id": "0303456789963",
		"name": "Casa en venta 3hab San Fernando",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex tincidunt nunc molestie auctor.",
		"price": 40,
	},
	{
		"id": "0303456789963",
		"name": "Dpto en alquiler 1hab Palermo",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex tincidunt nunc molestie auctor.",
		"price": 95,
	},
	{
		"id": "0303456789963",
		"name": "Monoambiente alq Pehuajó",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex tincidunt nunc molestie auctor.",
		"price": 49,
	}
]
```
* [List Properties] : `GET /api/properties/list-available`

# List properties

Get the list of properties .

**URL** : `/api/properties/list-available`

**Metodo** : `GET`

**Requiere Autenticación** : YES

**Header** : x-access-token

**Permissions required** : None

## Response Exitosa

**Code** : `200 OK`

**Content examples**

```json

[
	{
		"id": "0303456789963",
		"name": "Casa en venta 3hab San Fernando",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex tincidunt nunc molestie auctor.",
		"price": 40,
		"available": "[true]"
	},
	{
		"id": "0303456789963",
		"name": "Dpto en alquiler 1hab Palermo",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex tincidunt nunc molestie auctor.",
		"price": 95,
		"available": "[true]"
	},
	{
		"id": "0303456789963",
		"name": "Monoambiente alq Pehuajó",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex tincidunt nunc molestie auctor.",
		"price": 49,
		"available": "[true]"
	}
]
``` 

* [Create a Property]: `POST /api/properties/create`

Used to register a new property to offer.

**URL** : `/api/properties/create`

**Metodo** : `POST`

**Requiere Autenticación** : YES

**Restricciones de Datos**

```json
{	
	"id": "[integer]",
	"name": "[string]",
	"description": "[text]",
	"images":"string url",
	"address": "[string, valid text plain address of the property]",
	"province": "[string, valid text plain province of the property]",
	"country": "[string, valid text plain country of the property]",
	"price": "[float, valid price amount that includes decimals]",
	"available": "[boolean]",
	"total_area":"string",
	"bedrooms":"integer",
	"bathrooms":"integer",
	"garage":"integer",
	"swimming_pool":"integer",
	"balocny":"integer",
	"elevator":"integer",
	"antiquity":"STRING",
	"property_id":"integer",
	"created_at": "date",
	"updated_at": "date",
	}
```

**Ejemplos de datos**

```json
"result": {
		"id": "03034567899",
		"property_id":"20221218",
		"name": "Monoambiente alq Palermo pesos",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex tincidunt nunc molestie auctor.",
		"address": "123 fake street",
		"province": "MOntana",
		"country": "Argentina",
		"price": 125000,
		"available": "[true]",
		"createdAt": "2023-04-09T08:12:48.496Z",
		"updatedAt": "2023-04-09T16:56:01.426Z",
		"total_area":"500",
		"bedrooms":"4",
		"bathroom":"2",
		"garaje":"2",
		"swimming_pool":"1",
		"balcony":"0",
		"elevator":"1",
		"antiquity":"5"				
	}
```

## Response Exitosa

**Code** : `200 OK`

**Content example**

```json
{
	"name": "[Monoambiente alq Pehuajó]",
	"address": "[123 Fake street]",
	"province": "[Montana]",
	"price": "[150000]",
}
```

## Error Response

**Condition** : Si un campo de las detalles no cumple con los requisitos.

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "non_field_errors": [
        "Verificar que todos los campos esten cargados correctamente."
    ]
}
```
* [Get a Property] : `GET /api/properties/find/:id`

# Show a Property

Trae la ficha de la propiedad seleccionada

**URL** : `/api/properties/find/:id`

**Metodo** : `GET`

**Requiere Autenticación** : YES

**Permissions required** : None

## Response Exitosa

**Code** : `200 OK`

**Restricciones de Datos**

```json
{	
	"id": "[integer]",
	"name": "[string]",
	"description": "[text]",
	"images":"string url",
	"address": "[string, valid text plain address of the property]",
	"province": "[string, valid text plain province of the property]",
	"country": "[string, valid text plain country of the property]",
	"price": "[float, valid price amount that includes decimals]",
	"available": "[boolean]",
	"total_area":"string",
	"bedrooms":"integer",
	"bathrooms":"integer",
	"garage":"integer",
	"swimming_pool":"integer",
	"balocny":"integer",
	"elevator":"integer",
	"antiquity":"STRING",
	"property_id":"integer",
	"created_at": "date",
	"updated_at": "date",
	}
```

**Ejemplos de contenido**

```json
{
	"result": {
		"id": "03034567899",
		"property_id":"123123456",
		"name": "Monoambiente alq Palermo pesos",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex tincidunt nunc molestie auctor.",
		"address": "123 fake street",
		"province": "MOntana",
		"country": "Argentina",
		"price": 125000,
		"available": "[true]",
		"createdAt": "2023-04-09T08:12:48.496Z",
		"updatedAt": "2023-04-09T16:56:01.426Z",
		"total_area":"500",
		"bedrooms":"4",
		"bathroom":"2",
		"garaje":"2",
		"swimming_pool":"1",
		"balcony":"0",
		"elevator":"1",
		"antiquity":"5"				
	}
}
```

## Notes

* Endpoint will ignore irrelevant and read-only data such as parameters that
  don't exist, or fields that are not editable like `id` or `email`.
* Similar to the `GET` endpoint for the User, if the User does not have a
  UserInfo instance, then one will be created for them.

* [Update a Property] : `POST /api/properties/update/:id`

# Update Property

Allow the Authenticated User as admin to update property info.

**URL** : `/api/properties/update/:id`

**Metodo** : `POST`

**Requiere Autenticación** : YES

**Header**: x-access-token

**Permissions required** : None

**Ejemplos de datos**

Puede modificar un solo valor

```json
{
	"price": 180000
}
```

## Response Exitosa

**Condition** : Data provided is valid and User is Authenticated.

**Code** : `200 OK`

**Content example** :

```json
{
	"id": "0303456789963",
	"name": "Monoambiente alq Pehuajó",
	"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex tincidunt nunc molestie auctor.",
	"address": "123 fake street",
	"province": "MOntana",
	"country": "Argentina",
	"price": 185000,
	"available": "[true]"
}
```

## Error Response

**Condition** : If provided data is invalid, or a name field is too long.

**Code** : `400 BAD REQUEST`

**Content example** :

```json
{
    "first_name": [
        "Verifique los datos ingresados.",
    ]
}
```

* [Delete a Property]: `DELETE /api/properties/`

**URL** : `/api/properties/:id`

**Metodo** : `DELETE`

**Requiere Autenticación** : YES

**Header**: x-access-token

**Permissions required** : None

## Response Exitosa

**Code** : `200 OK`

**Content example** :

```json
{
"La propiedad ha sido eliminada."
}
```

## Error Response

**Code** : `400 BAD REQUEST`

**Content example** :

```json
{
    "Ocurrió un error al eliminar la propiedad."
}
``` 
