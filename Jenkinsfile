pipeline {
  agent {
    label 'kubernetes-agent'
  }

  environment {
    DEPLOY_ENV = "${env.BRANCH_NAME}"
    DOCKER_IMAGE = 'cbrian42/jungle-gym'
    DOCKER_CREDS = credentials('dockerhub-creds')
  }

  stages {
    stage('Build') {
      steps {
        echo "✅ Build du code pour ${DEPLOY_ENV}"
        sh 'npm install && npm run build'
      }
    }

    stage('Lint & Format') {
      steps {
        echo "🧐 Exécution des linters HTML, CSS et vérification du formatage"
        sh 'npm run lint:html'
        sh 'npm run lint:css'
        sh 'npm run format'
      }
    }

    stage('Docker Build & Push') {
      steps {
        script {
          echo "📦 Construction de l'image Docker pour ${DEPLOY_ENV}"
          sh "docker build -t ${DOCKER_IMAGE}:${DEPLOY_ENV} ."
          withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
            sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
            sh "docker push ${DOCKER_IMAGE}:${DEPLOY_ENV}"
          }
        }
      }
    }

    stage('Deploy to DEV') {
      when {
        branch 'develop'
      }
      steps {
        echo "🚀 Déploiement sur l'environnement de développement"
        sh 'kubectl apply -f k8s/dev/'
      }
    }

    stage('Deploy to staging') {
      when {
        branch 'staging'
      }
      steps {
        echo "🚀 Déploiement sur l'environnement de préproduction"
        sh 'kubectl apply -f k8s/staging/'
      }
    }

    stage('Deploy to Production') {
      when {
        branch 'prod'
      }
      steps {
        input message: "🛑 Confirmer le déploiement en production ?", ok: "Déployer"
        echo "🚀 Déploiement en production"
        sh 'kubectl apply -f k8s/prod/'
      }
    }
  }

  post {
    success {
      echo "✅ Pipeline terminé avec succès pour ${DEPLOY_ENV}"
    }
    failure {
      echo "❌ Pipeline échouée sur ${DEPLOY_ENV}"
    }
  }
}