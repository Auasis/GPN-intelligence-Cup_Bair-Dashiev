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
				sh ' docker build -t auasis/bairs_site '
			
			}	
		}
		stage("2-Publishing")
		{
			steps
			{
				echo "================|| start publishing || =================="
				sh 'docker push auasis/bairs_site'
			}
		}
	
	}


}
