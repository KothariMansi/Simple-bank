postgres:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=pass@4969 -d postgres:14-alpine

createdb:
	docker exec -it postgres14 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres14 dropdb simple_bank
migrateup:
	migrate -path db/migration -database "postgresql://root:pass@4969@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedowm:
	migrate -path db/migration -database "postgresql://root:pass@4969@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedowm sqlc