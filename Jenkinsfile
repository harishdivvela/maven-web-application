pipeline{

agent {label 'Linux_Slave'}

environment {
 //   DOCKERHUB_CREDENTIALS= credentials('dockerhub-hari')
      ivutest = sh(script: "docker ps -q", returnStdout: true)
}


   stages{

       stage('CheckOutCode'){
           steps{
              git branch: 'master', credentialsId: 'docker-test', url: 'https://github.com/harishdivvela/maven-web-application.git'
	
	         }
	         
        }
    
        stage('Build'){
            steps{
              sh "mvn clean package"
            }  
        }
    
  
        stage('Build Docker image'){
            steps{
              sh 'docker build -t hari321/docker:$BUILD_NUMBER .'
            }
        }
        
        stage('login docker hub'){
            steps{
                
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u hari321 -p ${dockerhubpwd}'
                   }
                   sh 'docker push hari321/docker:$BUILD_NUMBER'
               
               }
            }
            
        }
        
        stage ('docker deployment')
	    {
           steps
		   {
		
		       withCredentials([usernamePassword(credentialsId: 'docker-ivu', passwordVariable: 'pwd', usernameVariable: 'user')]) 
		       {
		           //sh "sshpass -p $pwd ssh $user@10.127.129.62 sudo docker stop my-app-8 && docker rm my-app-8" 
		          //sh "sshpass -p $pwd ssh $user@10.127.129.62 \"sudo docker ps --format \"{{.Names}}\" | xargs sudo docker kill\""
		          //sh "sshpass -p $pwd ssh $user@10.127.129.62 \"sudo docker ps -a --format \"{{.Names}}\" | xargs sudo docker kill | xargs sudo docker rm && docker run -p 80:80 -d --name my-app-8 dtr.nagarro.com:443/ivu-docker:1.1.13\""
		           //sh 'sshpass -p $PASS ssh -o StrictHostKeyChecking=no $USER@10.127.129.197 mkdir -p $JENKINS_HOME/workspace/$JOB_NAME'
		       }
		   }
		   
	    }
	    
   }
   
}   
		           
        
   
