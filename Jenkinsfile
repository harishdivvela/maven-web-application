pipeline{

agent any
triggers{
pollSCM('* * * * *')
}

options{
timestamps()
buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5'))
}

stages{

  stage('CheckOutCode'){
    steps{
    git branch: 'development', credentialsId: '957b543e-6f77-4cef-9aec-82e9b0230975', url: 'https://github.com/devopstrainingblr/maven-web-application-1.git'
	
	}
  }
  
  stage('Build'){
  steps{
  sh  "mvn clean package"
  }
  }
 stage('SCA'){
  steps{
	  script{
	dependencyCheck additionalArguments: '', odcInstallation: 'sca'
	
  }
  }
  }
//  stage('SCA-RESULTS-CHECK'){
//  steps{
//	  script{
//	dependencyCheckPublisher failedTotalCritical: 1, failedTotalHigh: 1, failedTotalLow: 1, failedTotalMedium: 1, pattern: '**/dependency-check-report.xml'
//  	if (currentBuild.rawBuild.getLog(50).contains('[DependencyCheck] Findings exceed configured thresholds')) {
//        error("Build failed due to vulnerabilities found during dependencyCheck")    
//}else{
//        sh 'echo "No vulnerabilities found during dependencyCheck"'
//} 
//	  } 
//  }
//  }
        
  stage('SAST-SONARQUBE'){
    steps{
      script{	    
    	 def scannerHome = tool 'SonarQubeNew';	 
          sh "${scannerHome}/bin/sonar-scanner -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=33739226d5a66a4a1aa027a098af8c7aea11a466 -Dsonar.organization=harishdevsecops -Dsonar.projectKey=sast-java-key -Dsonar.projectName=sast-java -Dsonar.projectVersion=1.0 -Dsonar.sources=src -Dsonar.java.binaries=target"
      }
   }
  }	  
}
}	
