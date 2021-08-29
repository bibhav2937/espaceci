podTemplate(label: 'mypod', cloud: 'kubernetes',
  containers: [
    containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true, privileged: true),
    containerTemplate(name: 'kubectlhelm', image: 'dtzar/helm-kubectl:latest', command: 'cat', ttyEnabled: true, privileged: true),
  ],
  volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')]) {
  node('mypod') {
      checkout scm

      stage("Build App"){
        container("docker"){
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

      stage("Build Push") {
        echo env.BRANCH_NAME
      }

    }
  }