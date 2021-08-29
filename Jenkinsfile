podTemplate(label: 'mypod', cloud: 'kubernetes',
  containers: [
    containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true, privileged: true),
    containerTemplate(name: 'kubectlhelm', image: 'dtzar/helm-kubectl:latest', command: 'cat', ttyEnabled: true, privileged: true),
  ],
  volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')]) {
  node('mypod') {
      checkout scm

      def DOCKERREPO = "bibhav2937/espace"
      def IMAGE_TAG = "v1"
      def BRANCH_NAME = "espaceci-dev"
      def DOCKERUSER = "bibhav2937"
      def DOCKERPASS = "cdd735e8-9723-45c4-8a5b-cbd9df98bfa1"

      container("docker"){

              stage("Build App"){        
                sh("docker build -t espace:v1 .")
                echo "Build Done"
                sh "docker tag espace:v1 ${DOCKERREPO}:${IMAGE_TAG}"
                echo "Tag Done"
              }

              if( BRANCH_NAME == "espaceci-dev") {
                stage("Image Push"){ 
                  sh "docker login -u ${DOCKERUSER} -p ${DOCKERPASS}"
                  echo "Login Done"
                  sh "docker push ${DOCKERREPO}:${IMAGE_TAG}"  
                  echo "Push Done"
                }
              }

      }

    }
  }