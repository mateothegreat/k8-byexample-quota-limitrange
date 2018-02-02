#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#

NS      ?= default
NAME    ?= quota

install:    quota_install limits_install quota limits
get:        quota limits
delete:     quota_delete limits_delete

quota:

	kubectl describe --namespace $(NS) quota

quota_install:

	kubectl apply --namespace $(NS) -f quota.yaml

quota_delete:

	kubectl delete --ignore-not-found --namespace $(NS) -f quota.yaml

limits:

	kubectl describe --namespace $(NS) limits

limits_install:

	kubectl apply --namespace $(NS) -f limits.yaml

limits_delete:

	kubectl delete --ignore-not-found --namespace $(NS) -f limits.yaml
