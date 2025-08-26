dots:
	@for i in $$(seq 1 20); do echo "."; sleep 5; done

apply:
	tofu init
	tofu apply -auto-approve