# GPN-intelligence-Cup_Bair-Dashiev

1 Предварительные требования

	 - виртуальная машина или хост с Linux на борту
	 
	 - установить Jenkins ( https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04-ru ) 
	 - установить docker ( https://docs.docker.com/engine/install/ubuntu/ )
	 
	 - иметь доступ в репозиторий гитхаб ( если нет писать на почту aquilaromana@mail.ru )
	 
	 - в Jenkinsfile "stage publiching" требуется заменить * на ваши данные


2   Создание pipeline 

	 - Зайти в "Jenkins"
	 
	 - Нажать "создать item" 


3  Настройка

	 - Ввести имя item'a  и выбрать "pipeline"
	
	 - В "Definition" выбрать "Pipeline script from SCM"
	
	 - В "SCM" - Git

	 - В "Repository URL" вставляете ссылку на свой git репозиторий 
		
	 - В "Credentials" выбираете свой способ подключения к репозиторию, в моем случае это "Username with password"

	 - Выбираете branch в которым находится ваш Jenkinsfile
		
	 - В "Script Path" вводите имя своего Jenkinsfile.		

	 - Нажимаете "Сохранить"
   
4 Запуск pipeline
	
	 - Жмете на кнопку в виде часов

5 Проверка сайта

	 - В поисковую строку вашего браузера вводите hostname:port (port- 8000)
