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
        withCredentials(
          [
            usernamePassword(credentialsId: "dockercreds" ,
              usernameVariable: "dockeruser" ,
              passwordVariable: "dockerpass"
            )
          ]
        ){
          print 'username=' + dockeruser + 'password=' + dockerpass
        }
          // container("docker") {
          //     sh "docker --version"
          //     sh "ls -lrt"             
          // }
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