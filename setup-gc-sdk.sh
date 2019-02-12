export CLUSTER_NAME="nexus-app"
# Environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import GCP public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#Update and install Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk kubectl
# Initialize the Google Cloud Auths and accept the prompts
gcloud init
# Creating a kubernetes cluster
gcloud container clusters create $CLUSTER_NAME
