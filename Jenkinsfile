pipeline {

    tools {
        maven 'maven-3.8.7'
    }
  environment {
    dockerimagename = "ayush0773/product-catalogue"
    registryCredential = 'dockerhublogin'
    dockerImage = ""
    DATE = new Date().format('yy.M')
    TAG = "${DATE}.${BUILD_NUMBER}"
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/ayush9200/ProductCatalogue'
      }
    }

    stage ('Build') {
                steps {
                    sh 'mvn clean package'
                }
            }


    stage('Build Docker image') {
      steps{
        script {
          docker.build("${dockerimagename}:${TAG}")
        }
      }
    }

    stage('Pushing Image') {
      steps{
        script {
            docker.withRegistry('https://registry.hub.docker.com', 'dockerhublogin') {
              docker.image("${dockerimagename}:${TAG}").push()
              docker.image("${dockerimagename}:${TAG}").push("latest")
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
        }
      }
    }

  }

}