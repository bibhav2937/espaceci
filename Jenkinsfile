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
              echo env.PASSWORD
              echo env.USERNAME
              docker login -u env.USERNAME -p env.PASSWORD
              docker build -t espace:v1 . 
              docker tag espace:v1 bibhav2937/espace:v1
              docker push bibhav2937/espace:v1
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