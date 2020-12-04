# SETUP

rake db:create
rake db:migrate
rails s

User Registration
curl -X POST \
  http://localhost:3000/users \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost' \
  -H 'Postman-Token: 3958602f-20ad-416c-bcde-77eda7fa3e2e' \
  -H 'cache-control: no-cache' \
  -d '{
    "user": {
        "email": "guy@gmail.com",
        "password": "111111"
    }
}'

User Login
curl -X POST \
  http://localhost:3000/users/sign_in \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost' \
  -H 'Postman-Token: 3958602f-20ad-416c-bcde-77eda7fa3e2e' \
  -H 'cache-control: no-cache' \
  -d '{
    "user": {
        "email": "guy@gmail.com",
        "password": "111111"
    }
}'

User Logout
curl -X DELETE \
  http://localhost:3000/users/sign_out \
  -H 'Access-Token: eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTgsImVtYWlsIjoiZ3V5QGdtYWlsLmNvbSIsImV4cCI6MTYwNzE1ODEyNH0.Xic1tPtevOkN4p_5QLqV9o7u9t9KjUzeNYOg-ZzmSBQ' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost' \
  -H 'Postman-Token: 3958602f-20ad-416c-bcde-77eda7fa3e2e' \
  -H 'cache-control: no-cache'
}'

Fetch Product Resource
curl -X GET \
  http://localhost:3000/products \
  -H 'Access-Token: eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTgsImVtYWlsIjoiZ3V5QGdtYWlsLmNvbSIsImV4cCI6MTYwNzE1ODEyNH0.Xic1tPtevOkN4p_5QLqV9o7u9t9KjUzeNYOg-ZzmSBQ' \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: adcb724c-dcac-4976-a64b-67644ca48063' \
  -H 'cache-control: no-cache'
