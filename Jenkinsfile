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
			def result=0
			steps
			{
				echo "=================|| start test ||================"
				sh ' docker run -d -p 8000:80 auasis/bairs_site '
				sh """#!/bin/bash  
				docker ps | awk "{print \$1}" | awk 'FNR == 2 {print}' 
				"""
				sh ' docker exec -ti auasis/bairs_site bash '
				sh ' ${result}=grep "Instagram" ~/index.html | wc -l ' 
				sh ' exit '
				switch(result)	
				{
					case "2" :
					echo "Test Passed"
					default :
					echo "Test Failed"
					exit 1
				}
				sh """ docker stop /(docker ps -q) """
				sh """ docker rm -v \$(docker ps -aq -f status=exited) """
				
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
