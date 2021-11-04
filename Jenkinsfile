pipeline 
{
	agent any

	environment 
	{
	 PROJECT_NAME = "Участие в чемпинате"
	 OWNER_NAME   = "Bair Dashiev"
	}
	
	options 
	{
	 buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
	 timestamps()
	}
	stages 
	{
	
		stage("1-Build")
		{
			steps 
			{
				echo "==================|| start building image ||================"
				sh ' docker build -t bairs_site .'
						
			}	
		}
		stage("2-Test")
		{
			
			steps
			{
				
				echo "=================|| start test ||================"
				sh ' docker run -d -p 8000:80 --name my_con auasis/bairs_site '
				var = sh( ' docker ps -aqf "name=my_con" ',returnStdout : true).trim()
				script {
					
					TESTER = sh( [script :' docker exec ${var} grep "Instagram" /usr/local/apache2/htdocs/index.html | wc -l  ',returnStdout : true]).trim()
				}
				echo "my container= ${var}"
				sh 'docker rm -f my_con'
				//test(TESTER)
				//sh """#!/bin/bash
				//docker rm -f ${var}
				//"""
				
				
			}

			
		}
		
		stage("3-Publishing")
		{
			steps
			{
				echo "================|| start publishing ||=================="
				sh ' docker login -u auasis -p LaLka120'
				sh ' docker push auasis/bairs_site' 
			}
		}
		stage("4-Deployment")
		{
			steps
			{
				echo "===============|| start deployment ||==============="
				sh ' docker run -d -p 8000:80 --name my_con auasis/bairs_site '
			}
		}
	}
}
def test(TESTER) {
		if (test_result < "1" ) {
			echo "Test Passed"
			return 0
		}
		else { 
			echo "Test Failed"
			return 1 
		}
}
