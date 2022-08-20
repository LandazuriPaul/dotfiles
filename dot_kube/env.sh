# Variables
DEFAULT_KUBECONFIG_FILE="$HOME/.kube/config"
EXTRA_KUBECONFIG_FOLDER="$HOME/.kube/configs"

# Extra kubeconfig files
[ -d "${EXTRA_KUBECONFIG_FOLDER}" ] && \
    for kubeconfigFile in $(find "${EXTRA_KUBECONFIG_FOLDER}" -type f -name "*.yml" -o -name "*.yaml");
    do
        export KUBECONFIG="$kubeconfigFile:$KUBECONFIG"
    done

# Default kubeconfig ~/.kube/config
[ -f "${DEFAULT_KUBECONFIG_FILE}" ] && export KUBECONFIG="$DEFAULT_KUBECONFIG_FILE:$KUBECONFIG"

# If no default, make sure the KUBECONFIG doesn't end with ":"
if [[ "${KUBECONFIG: -1}" == ":" ]]; then
  KUBECONFIG=${KUBECONFIG:0:-1}
fi
