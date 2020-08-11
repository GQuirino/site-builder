# README

# Setup


```cmd
docker-compose build
```

```cmd
docker-compose run --rm web rake db:create db:setup
```

```cmd
docker-compose up -d web
```
# Tests
To run the tests
```cmd
docker-compose run --rm web rspec
```

# Tasks
To generate html from pages
```cmd
docker-compose run --rm web rake site:generate_pages 
```
#  Routes

## Sites

`GET /api/v1/sites/`
  - Returns all sites

`POST /api/v1/sites/`
  - Creates new Site\
  Body:
  ```javascript
  {
    "site": {
          "title": "Site Title",
          "icon": "icon_path_url",
          "background_color": "#005566ff",
          "banner_attributes": {
              "title_color": "#005577ff",
              "background_color": "#005676ff"
          },
          "widgets_attributes": [
              {
                  "title": "WID_TITLE_1",
                  "content": "WID_CONTENT_1",
                  "background_color": "#558877",
                  "position": 1
              },
              {
                  "title": "WID_TITLE_2",
                  "content": "WID_CONTENT_2",
                  "background_color": "#558877",
                  "position": 2
              }
          ]
    }
  }
  ```

`PUT /api/v1/sites/:id`
  - Updates Site\
  Body:
  ```javascript
  {
    "site": {
          "title": "Site Title",
          "icon": "icon_path_url",
          "background_color": "#005566ff",
          "banner_attributes": {
              "id": 1,
              "title_color": "#005577ff",
              "background_color": "#005676ff"
          },
          "widgets_attributes": [
              {
                  "id": 1,
                  "title": "WID_TITLE_1",
                  "content": "WID_CONTENT_1",
                  "background_color": "#558877",
                  "position": 1
              },
              {
                  "id": 2,
                  "title": "WID_TITLE_2",
                  "content": "WID_CONTENT_2",
                  "background_color": "#558877",
                  "position": 2
              }
          ]
    }
  }
  ```
  
`DELETE /api/v1/sites/:id`
  - Deletes Site

`GET /api/v1/sites/:id/page`
  - Returns Html code rendered

## Banners

`PUT /api/v1/banners/:id`
  - Updates Banner\
  Body:
  ```javascript
  {
    "banner": {
      "title_color": "#005577ff",
      "background_color": "#005676ff"
    }
  }
  ```

`DELETE /api/v1/banners/:id`
  - Deletes Banner\


## Widgets

`PUT /api/v1/widgets/:id`
  - Updates Widget\
  Body:
  ```javascript
  {
    "widget": {
      "title": "WID_TITLE_1",
      "content": "WID_CONTENT_1",
      "background_color": "#558877",
      "position": 1
    }
  }
  ```
`DELETE /api/v1/widgets/:id`
  - Deletes Widget\
