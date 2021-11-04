pipeline 
{
	agent any

	environment 
	{
	 PROJECT_NAME = "Участие в чемпинате"
	 OWNER_NAME   = "Bair Dashiev"
	 result = test()
	}
	
	def test(test_result) {
		sh ' exit '
		if (test_result < "1" ) {
			echo "Test Passed"
			return 0
		}
		else { 
			echo "Test Failed"
			return 1 
		}
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
				echo " echo $OWNER_NAME"
			
			}	
		}
		stage("2-Test")
		{
			
			steps
			{
				
				echo "=================|| start test ||================"
				sh ' docker run -d -p 8000:80 auasis/bairs_site '
				sh """#!/bin/bash  
				var=\$(docker ps | awk '{print \$1}' | grep -v "^CONTAINER")
				"""
				sh """#!/bin/bash
				docker exec -ti ${var} 
				"""
				script {
					
				TESTER =  sh ( 
					script : ' grep "Instagram" ~/index.html | wc -l ',
					returnStdout: true
				)
					
				}
				test(TESTER)
				
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
				sh ' docker run -d -p 8000:80 auasis/bairs_site '
			}
		
		}
		
	
	}


}
