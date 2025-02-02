# README

Para instalar as gems do projeto, rode o comando "bundle install" no terminal.

para rodar o servidor rails, rode o comando "rails server" ou "rails s" no terminal.

Para rodar o console do rails, rode o comando "rails console" ou "rails c" no terminal.

Para rodar todos os testes da pasta "spec", digite "rspec spec/" no terminal.

Para rodar um teste específico de um arquivo da pasta "/spec", digite o comando "rspec"
junto com o caminho relativo do arquivo no terminal, e a linha onde o teste está.
  Ex: "rspec spec/requests/shopping_car_products_request_spec.rb:78"

Observação: Não deu tempo de adicionar a gem "active_storage" para adicionar as
            imagens dos produtos, nem de fazer a versão front-end do projeto e
            nem de hospedar em um servidor de produção, portanto, estou enviando
            apenas a versão back-end do projeto.

Endpoints:
  Login de usuário:
    path: "/auth/sign_in"
    request:
      verbo http: "POST",
      "headers": {
        "access-token": "GGz7I3cAge_7aQzau_CyJg",
        "uid": "myemail1@gmail.com",
        "client": "2U_5zCSEXDTNm7DutqzJ4Q",
        "token-type": "Bearer",
        "expiry": "1739474948",
        "Authorization": "Bearer eyJhY2Nlc3MtdG9rZW4iOiJHR3o3STNjQWdlXzdhUXphdV9DeUpnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IjJVXzV6Q1NFWERUTm03RHV0cXpKNFEiLCJleHBpcnkiOiIxNzM5NDk4NTk0IiwidWlkIjoibXllbWFpbDFAZ21haWwuY29tIn0="
      }

      body: {
        "email": "email2example.com",
        "password": "12345678"
      }

    response:
      {
        "data": {
            "email": "email2@example.com",
            "provider": "email",
            "uid": "email2@example.com",
            "id": 2,
            "allow_password_change": false,
            "name": null,
            "nickname": null,
            "image": null
        }
    }

    status_code: 200 OK


  Cadastro de Usuário:
    path: "/auth"
    request:
      verbo http: "POST",
      "headers": {
        "access-token": "GGz7I3cAge_7aQzau_CyJg",
        "uid": "myemail1@gmail.com",
        "client": "2U_5zCSEXDTNm7DutqzJ4Q",
        "token-type": "Bearer",
        "expiry": "1739474948",
        "Authorization": "Bearer eyJhY2Nlc3MtdG9rZW4iOiJHR3o3STNjQWdlXzdhUXphdV9DeUpnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IjJVXzV6Q1NFWERUTm03RHV0cXpKNFEiLCJleHBpcnkiOiIxNzM5NDk4NTk0IiwidWlkIjoibXllbWFpbDFAZ21haWwuY29tIn0="
      }

      body: {
        "email": "novoemail@gmail.com",
        "password": "12345678",
        "password_confirmation": "12345678"
      }

    response:
      {
        "status": "success",
        "data": {
            "id": 4,
            "provider": "email",
            "uid": "novoemail@gmail.com",
            "allow_password_change": false,
            "name": null,
            "nickname": null,
            "image": null,
            "email": "novoemail@gmail.com",
            "created_at": "2025-02-02T23:07:49.458Z",
            "updated_at": "2025-02-02T23:07:49.530Z"
        }
    }

    status_code: 200 OK
    
  Listagem de produtos:
    path: "/products"
    request:
      verbo http: "GET",

    response:
      [
        {
          "id": 1,
          "name": "Caneta",
          "price": 2
        },
        {
          "id": 2,
          "name": "Fones de ouvido",
          "price": 9
        },
        {
          "id": 3,
          "name": "Notebook",
          "price": 2569
        },
        {
          "id": 4,
          "name": "Televisão",
          "price": 50
        },
        {
          "id": 5,
          "name": "Monitor",
          "price": 38
        }
    ]

    status_code: 200 OK
  
  Visualizar produto:
    path: "/products/:id"
    request:
      verbo http: "GET",

    response:
        {
          "id": 1,
          "name": "Caneta",
          "price": 2
        }
    

    status_code: 200 OK
    
  Listar produtos no carrinho:
    path: "/shopping_car_products"
    request:
      verbo http: "GET",
      "headers": {
        "access-token": "GGz7I3cAge_7aQzau_CyJg",
        "uid": "myemail1@gmail.com",
        "client": "2U_5zCSEXDTNm7DutqzJ4Q",
        "token-type": "Bearer",
        "expiry": "1739474948",
        "Authorization": "Bearer eyJhY2Nlc3MtdG9rZW4iOiJHR3o3STNjQWdlXzdhUXphdV9DeUpnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IjJVXzV6Q1NFWERUTm03RHV0cXpKNFEiLCJleHBpcnkiOiIxNzM5NDk4NTk0IiwidWlkIjoibXllbWFpbDFAZ21haWwuY29tIn0="
      }

    response:
      [
        {
          "id": 1,
          "name": "Caneta",
          "quantity": 1,
          "value": 2,
          "shopping_car": {
              "id": 1,
              "user": 2
          }
        },
        {
          "id": 2,
          "name": "Fones de ouvido",
          "quantity": 1,
          "value": 9,
          "shopping_car": {
              "id": 1,
              "user": 2
          }
        },
        {
          "id": 3,
          "name": "Notebook",
          "quantity": 1,
          "value": 2569,
          "shopping_car": {
              "id": 1,
              "user": 2
          }
        },
      ]

    status_code: 200 OK
    
  Adicionar produto ao carrinho:
    path: "/shopping_car_products"
    request:
      verbo http: "POST",
      "headers": {
        "access-token": "GGz7I3cAge_7aQzau_CyJg",
        "uid": "myemail1@gmail.com",
        "client": "2U_5zCSEXDTNm7DutqzJ4Q",
        "token-type": "Bearer",
        "expiry": "1739474948",
        "Authorization": "Bearer eyJhY2Nlc3MtdG9rZW4iOiJHR3o3STNjQWdlXzdhUXphdV9DeUpnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IjJVXzV6Q1NFWERUTm03RHV0cXpKNFEiLCJleHBpcnkiOiIxNzM5NDk4NTk0IiwidWlkIjoibXllbWFpbDFAZ21haWwuY29tIn0="
      }

      body: 
      {
        "shopping_car_product": {
            "product_id": 5,
            "shopping_car_id": 1,
            "quantity": 2
        }
      }

    response: 
      {
        {
          "id": 7,
          "name": "Monitor",
          "quantity": 2,
          "value": 76,
          "shopping_car": {
              "id": 1,
              "user": 2
          }
        }
      }

    status_code: 201 Created
    
  Deletar produto do carrinho:
    path: "/shopping_car_products/:id"
    request:
      verbo http: "POST",
      "headers": {
        "access-token": "GGz7I3cAge_7aQzau_CyJg",
        "uid": "myemail1@gmail.com",
        "client": "2U_5zCSEXDTNm7DutqzJ4Q",
        "token-type": "Bearer",
        "expiry": "1739474948",
        "Authorization": "Bearer eyJhY2Nlc3MtdG9rZW4iOiJHR3o3STNjQWdlXzdhUXphdV9DeUpnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IjJVXzV6Q1NFWERUTm03RHV0cXpKNFEiLCJleHBpcnkiOiIxNzM5NDk4NTk0IiwidWlkIjoibXllbWFpbDFAZ21haWwuY29tIn0="
      }


    response:

    status_code: 204 no_content
    
  Editar produto do carrinho:
    path: "/shopping_car_products/:id"
    request:
      verbo http: "PUT",
      "headers": {
        "access-token": "GGz7I3cAge_7aQzau_CyJg",
        "uid": "myemail1@gmail.com",
        "client": "2U_5zCSEXDTNm7DutqzJ4Q",
        "token-type": "Bearer",
        "expiry": "1739474948",
        "Authorization": "Bearer eyJhY2Nlc3MtdG9rZW4iOiJHR3o3STNjQWdlXzdhUXphdV9DeUpnIiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IjJVXzV6Q1NFWERUTm03RHV0cXpKNFEiLCJleHBpcnkiOiIxNzM5NDk4NTk0IiwidWlkIjoibXllbWFpbDFAZ21haWwuY29tIn0="
      }

      body: 
      {
        "shopping_car_product": {
            "quantity": 2
        }
      }

    response: 

    status_code: 204 no_content