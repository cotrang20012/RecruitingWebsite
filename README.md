# NHÓM 2
# XÂY DỰNG ỨNG DỤNG WEB TUYỂN DỤNG


## Công nghệ sử dụng
![](https://img.icons8.com/color/48/000000/html-5.png)
![](https://img.icons8.com/color/48/000000/css3.png)
![](https://img.icons8.com/color/48/000000/javascript.png)
![](https://img.icons8.com/color/48/000000/bootstrap.png)
![](https://img.icons8.com/color/48/000000/java-coffee-cup-logo.png)
![](https://img.icons8.com/color/48/000000/tomcat.png)
![](https://img.icons8.com/color/48/000000/mongodb.png)
![](https://img.icons8.com/color/48/000000/heroku.png)
![](https://img.icons8.com/color/48/000000/trello.png)
![](https://img.icons8.com/color/48/000000/jsp.png)

## Link website
http://tuyendung.herokuapp.com/

## Deploy

- 1. Mở CMD/PowerShell
- 2. Đăng nhập vào heroku

```console
heroku login
```

  *Cài thêm plugin java (nếu lần đầu deploy)*

```console
heroku plugins:install java
```

- 3. Export project ra file *.war

- 4. Deploy file war lên heroku

  - Cú pháp:
  
```console
heroku war:deploy <path đến file *.war> -a <tên app heroku>
```

  - Cụ thể:
  
```console
heroku war:deploy x4fit.war -a x4fit
```

## Project Structure

```console
tree \F > output.txt
```
<details>
  <summary> Chi tiết </summary>

```console
x4fit
    │   .classpath
    │   .project
    │   pom.xml
    ├───bin   
    ├───src
    │   ├───controller
    │   │       adminController.java
    │   │       commentController.java
    │   │       createController.java
    │   │       editController.java
    │   │       forgotPassword.java
    │   │       galleryController.java
    │   │       homeController.java
    │   │       logInController.java
    │   │       postController.java
    │   │       profileController.java
    │   │       saveController.java
    │   │       signUpController.java
    │   │       uploadController.java
    │   ├───model
    │   │       Account.java
    │   │       Address.java
    │   │       Authentication.java
    │   │       Category.java
    │   │       Comment.java
    │   │       DAO.java
    │   │       Gallery.java
    │   │       Model.java
    │   │       Post.java
    │   │       User.java    
    │   └───x4fit
    │           HibernateUtil.java
    │           Utilities.java
    ├───target
    │   ├───classes 
    │   ├───dependency
    │   │       bson-3.8.2.jar
    │   │       hamcrest-core-1.3.jar
    │   │       junit-4.11.jar
    │   │       mongo-java-driver-3.8.2.jar
    │   │       mongodb-driver-3.8.2.jar
    │   │       mongodb-driver-core-3.8.2.jar
    │   │       servlet-api-2.5.jar  
    │   ├───fit
    │   │   └───WEB-INF
    │   │       │   persistence.xml
    │   │       │   web.xml
    │   │       └───lib
    │   │               bson-3.8.2.jar
    │   │               javax.persistence-api-2.2.jar
    │   │               mongo-java-driver-3.8.2.jar
    │   │               mongodb-driver-3.8.2.jar
    │   │               mongodb-driver-core-3.8.2.jar
    │   │               servlet-api-2.5.jar   
    │   └───test-classes
    └───WebContent
        │   404.jsp
        │   about.jsp
        │   index.jsp
        │   upload.jsp
        ├───admin
        │       posts.jsp
        │       users.jsp
        ├───common
        │       footer.jsp
        │       header.jsp
        ├───detailPost
        │       detailPost.jsp
        ├───images  
        ├───login
        │       forgot.jsp
        │       login.jsp
        │       signup.jsp   
        ├───META-INF
        │       MANIFEST.MF
        ├───posts
        │       create.jsp
        │       edit.jsp
        │       post.jsp
        ├───scripts
        │       post.js   
        ├───styles
        │       create-post.css
        │       home.css
        │       login.css
        │       post.css
        │       post_editor.css
        │       profile.css
        │       signup.css
        │       style.css 
        ├───upload
        ├───users
        │       profile.jsp
        └───WEB-INF
            │   web.xml
            └───lib
                    bson-3.12.0.jar
                    commons-codec-1.15.jar
                    commons-lang3-3.11.jar
                    cre.txt
                    credentials.json
                    hashgenerator-1.1.0.jar
                    hibernate-testing-5.4.27.Final.jar
                    javax.mail.jar
                    json-20201115.jar
                    jstl-1.2.jar
                    mongo-java-driver-3.12.7.jar
                    mongodb-driver-3.2.2.jar
                    mongodb-driver-core-3.2.2.jar
                    slf4j-api-1.7.30.jar
                    slf4j-jdk14-1.7.30.jar
```
</details>
