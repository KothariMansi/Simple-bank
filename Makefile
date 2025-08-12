include app.env
export

DB_URL=postgresql://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@localhost:5432/$(POSTGRES_DB)?sslmode=disable

postgres:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=$(POSTGRES_USER) -e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) -d postgres:14-alpine

createdb:
	docker exec -it postgres14 createdb --username=$(POSTGRES_USER) --owner=$(POSTGRES_USER) $(POSTGRES_DB)

dropdb:
	docker exec -it postgres14 dropdb $(POSTGRES_DB)

migrateup:
	migrate -path db/migration -database ""$(DB_URL)"" -verbose up

migrateup1:
	migrate -path db/migration -database ""$(DB_URL)"" -verbose up 1

migratedown:
	migrate -path db/migration -database ""$(DB_URL)"" -verbose down

migratedown1:
	migrate -path db/migration -database ""$(DB_URL)"" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/KothariMansi/simplebank/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migrateup1 migratedown migratedown1 sqlc test server mock