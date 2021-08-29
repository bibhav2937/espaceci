podTemplate(label: 'mypod', cloud: 'kubernetes',
  containers: [
    containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true, privileged: true),
    containerTemplate(name: 'kubectlhelm', image: 'dtzar/helm-kubectl:latest', command: 'cat', ttyEnabled: true, privileged: true),

    // containerTemplate(name: 'jnlp', image: 'jenkinsci/jnlp-slave:alpine', args: '${computer.jnlpmac} ${computer.name}', privileged: true),
  ],
  volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')]) {
  node('mypod') {
       checkout scm

      stage("Build and Push") {
          container("docker") {
              // sh "docker --version"
              // sh "ls -lrt"    
            withCredentials([[$class: 'UsernamePasswordMultiBinding' ,          
              credentialsId: "dockercreds" , 
              passwordVariable: 'PASSWORD', 
              usernameVariable: 'USERNAME'
            ]]) {
              echo $PASSWORD
              echo $USERNAME              
              sh "docker login -u '$USERNAME' -p '$PASSWORD'"
              echo "Login Done"
              sh "docker build -t espace:v1 ."
              echo "Build Done"
              sh "docker tag espace:v1 bibhav2937/espace:v1"
              echo "Tag Done"
              sh "docker push bibhav2937/espace:v1"            
              echo "Push Done"
            }      
          }
      }

      stage("To check kubectl and helm") {
          container("kubectlhelm") {
              sh "helm version"
              sh "kubectl version"
              sh "ls -lrt"
              sh "kubectl get all"
              // sh "python --version"              
          }
      }

    }
  }