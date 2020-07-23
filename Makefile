build :
	docker build -t flan_scan .

container_name = flan_$(shell date +'%s')
start :
	docker run --rm --name $(container_name) -v "$(CURDIR)/shared:/shared:Z" flan_scan

md :
	docker run --rm --name $(container_name) -v "$(CURDIR)/shared:/shared:Z" -e format=md flan_scan

html :
	docker run --rm --name $(container_name) -v "$(CURDIR)/shared:/shared:Z" -e format=html flan_scan

json :
	docker run --rm --name $(container_name) -v "$(CURDIR)/shared:/shared:Z" -e format=json flan_scan
