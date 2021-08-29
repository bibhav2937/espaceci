podTemplate(label: 'mypod', cloud: 'kubernetes',
  containers: [
    containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true, privileged: true),
    containerTemplate(name: 'kubectlhelm', image: 'dtzar/helm-kubectl:latest', command: 'cat', ttyEnabled: true, privileged: true),

    // containerTemplate(name: 'jnlp', image: 'jenkinsci/jnlp-slave:alpine', args: '${computer.jnlpmac} ${computer.name}', privileged: true),
  ],
  volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')]) {
  node('mypod') {
      checkout scm

    //   environment {
    //     DOCKERHUB_CREDS = credentialsId('dockercreds')
    //   }

      stage("Build and Push") {
          container("docker") {
            withCredentials([[$class: 'UsernamePasswordMultiBinding' ,          
              credentialsId: "dockercreds" , 
              passwordVariable: 'PASSWORD', 
              usernameVariable: 'USERNAME'
            ]]) {
              echo env.PASSWORD
              echo env.USERNAME              
              sh("docker build -t espace:v1 .")
              echo "Build Done"
              sh("docker tag espace:v1 bibhav2937/espace:v1")
              echo "Tag Done"
              sh("docker login -u 'bibhav2937' -p 'cdd735e8-9723-45c4-8a5b-cbd9df98bfa1'")
              echo "Login Done"
              sh("docker push bibhav2937/espace:v1")         
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