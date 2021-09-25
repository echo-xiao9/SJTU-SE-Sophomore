//#include <glad/glad.h>
//#include <GLFW/glfw3.h>
//#include <iostream>
//
//void framebuffer_size_callback(GLFWwindow* window, int width, int height);
//void processInput(GLFWwindow *window);
//
//// settings
//const unsigned int SCR_WIDTH = 800;
//const unsigned int SCR_HEIGHT = 600;
//
//
//const char *vertexShaderSource ="#version 330 core\n"
//    "layout (location = 0) in vec3 aPos;\n"
//    "layout (location = 1) in vec3 aColor;\n"
//    "layout (location = 2) in vec3 aColor2;\n"
//    "out vec3 ourColor;\n"
//    "out vec3 ourColor2;\n"
//    "void main()\n"
//    "{\n"
//    "   gl_Position = vec4(aPos, 1.0);\n"
//    "   ourColor = aColor;\n"
//    "   ourColor2 = aColor2;\n"
//    "}\0";
//
//const char *fragmentShaderSource = "#version 330 core\n"
//    "out vec4 FragColor;\n"
//    "in vec3 ourColor;\n"
//    "void main()\n"
//    "{\n"
//    "   FragColor = vec4(ourColor, 1.0f);\n"
//    "}\n\0";
//
//const char *fragmentShader2Source = "#version 330 core\n"
//    "out vec4 FragColor;\n"
//    "in vec3 ourColor2;\n"
//    "void main()\n"
//    "{\n"
//    "   FragColor = vec4(ourColor2, 1.0f);\n"
//    "}\n\0";
//
//int main()
//{
//    // glfw: initialize and configure
//    // ------------------------------
//    glfwInit();
//    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
//    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
//    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
//
//#ifdef __APPLE__
//    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
//#endif
//
//    // glfw window creation
//    // --------------------
//    GLFWwindow* window = glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "LearnOpenGL", NULL, NULL);
//    if (window == NULL)
//    {
//        std::cout << "Failed to create GLFW window" << std::endl;
//        glfwTerminate();
//        return -1;
//    }
//    glfwMakeContextCurrent(window);
//    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
//
//    // glad: load all OpenGL function pointers
//    // ---------------------------------------
//    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
//    {
//        std::cout << "Failed to initialize GLAD" << std::endl;
//        return -1;
//    }
//
//    // build and compile our shader program
//    // ------------------------------------
//    // vertex shader
//    unsigned int vertexShader = glCreateShader(GL_VERTEX_SHADER);
//    glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
//    glCompileShader(vertexShader);
//    // check for shader compile errors
//    int success;
//    char infoLog[512];
//    glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &success);
//    if (!success)
//    {
//        glGetShaderInfoLog(vertexShader, 512, NULL, infoLog);
//        std::cout << "ERROR::SHADER::VERTEX::COMPILATION_FAILED\n" << infoLog << std::endl;
//    }
//    // fragment shader !2
//    unsigned int fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
//    unsigned int fragmentShader2 = glCreateShader(GL_FRAGMENT_SHADER);
//    
//    glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
//    glShaderSource(fragmentShader2, 1, &fragmentShader2Source, NULL);
//    
//    glCompileShader(fragmentShader);
//    glCompileShader(fragmentShader2);
//    // check for shader compile errors !only one,we can add 2
//    glGetShaderiv(fragmentShader, GL_COMPILE_STATUS, &success);
//    if (!success)
//    {
//        glGetShaderInfoLog(fragmentShader, 512, NULL, infoLog);
//        std::cout << "ERROR::SHADER::FRAGMENT::COMPILATION_FAILED\n" << infoLog << std::endl;
//    }
//    
//    
//    // link shaders
//    unsigned int shaderProgram = glCreateProgram();
//    unsigned int shaderProgram2 = glCreateProgram();
//    glAttachShader(shaderProgram, vertexShader);
//    glAttachShader(shaderProgram2, vertexShader);
//    glAttachShader(shaderProgram, fragmentShader);
//    glAttachShader(shaderProgram2, fragmentShader2);
//    glLinkProgram(shaderProgram);
//    glLinkProgram(shaderProgram2);
//    
//    
//    
//    
//    
//    // check for linking errors
//    glGetProgramiv(shaderProgram, GL_LINK_STATUS, &success);
//    if (!success) {
//        glGetProgramInfoLog(shaderProgram, 512, NULL, infoLog);
//        std::cout << "ERROR::SHADER::PROGRAM::LINKING_FAILED\n" << infoLog << std::endl;
//    }
//    glDeleteShader(vertexShader);
//    glDeleteShader(fragmentShader);
//
//    // set up vertex data (and buffer(s)) and configure vertex attributes
//    // ------------------------------------------------------------------
//    float vertices[] = {
//        // positions         // colors
//         0.5f, -0.5f, 0.0f,  0.5f, 0.4f, 0.7f,  // bottom right
//        -0.5f, -0.5f, 0.0f,  0.5f, 0.4f, 0.7f,  // bottom left
//         0.0f,  0.5f, 0.0f,  0.1f, 0.1f, 0.9f   // top
//
//    };
//    
//    float vertices2[]={
//        1.0f, 0.0f, 0.0f,  0.5f, 0.4f, 0.7f,  // bottom right
//        0.0f, 0.0f, 0.0f,  0.5f, 0.4f, 0.7f,  // bottom left
//        0.5f, 1.0, 0.0f,  0.1f, 0.1f, 0.9f   // top
//        
//    };
//    float vertices3[]={
//        0.0f, -1.0f, 0.0f,  0.5f, 0.4f, 0.7f,  // bottom right
//        -1.0f,-1.0f, 0.0f,  0.5f, 0.4f, 0.7f,  // bottom left
//        -0.5f, 0.0, 0.0f,  0.1f, 0.1f, 0.9f   // top
//    };
//    
//    //! change
//    unsigned int VBOs[3], VAOs[3];
//    glGenVertexArrays(3, VAOs); // we can also generate multiple VAOs or buffers at the same time
//    glGenBuffers(3, VBOs);
//    
////    unsigned int VBO, VAO;
////    glGenVertexArrays(1, &VAO);
////    glGenBuffers(1, &VBO);
//    
//    // bind the Vertex Array Object first, then bind and set vertex buffer(s), and then configure vertex attributes(s).
//    glBindVertexArray(VAOs[0]);
//    glBindBuffer(GL_ARRAY_BUFFER, VBOs[0]);
//    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
//    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(3 * sizeof(float)));
//    glEnableVertexAttribArray(1);
//    
//    // bind the Vertex Array Object first, then bind and set vertex buffer(s), and then configure vertex attributes(s).
//    glBindVertexArray(VAOs[1]);
//    glBindBuffer(GL_ARRAY_BUFFER, VBOs[1]);
//    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices2), vertices2, GL_STATIC_DRAW);
////    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, (void*)0);
////    glEnableVertexAttribArray(0);
//
//    
//    // bind the Vertex Array Object first, then bind and set vertex buffer(s), and then configure vertex attributes(s).
//    glBindVertexArray(VAOs[2]);
//    glBindBuffer(GL_ARRAY_BUFFER, VBOs[2]);
//    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices3), vertices3, GL_STATIC_DRAW);
////    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, (void*)0);
////    glEnableVerteArray(0);
////
//    
//    
//    
////     color attribute
////    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(3 * sizeof(float)));
////    glEnableVertexAttribArray(1);
//
//    // You can unbind the VAO afterwards so other VAO calls won't accidentally modify this VAO, but this rarely happens. Modifying other
//    // VAOs requires a call to glBindVertexArray anyways so we generally don't unbind VAOs (nor VBOs) when it's not directly necessary.
//    // glBindVertexArray(0);
//
//    // as we only have a single shader, we could also just activate our shader once beforehand if we want to
//  
//
//
//
//    // render loop
//    // -----------
//    while (!glfwWindowShouldClose(window))
//    {
//        // input
//        // -----
//        processInput(window);
//
//        // render
//        // ------
//        glClearColor(0.6f, 0.6f, 1.0f, 0.5f);
//        glClear(GL_COLOR_BUFFER_BIT);
//        // first
//        glUseProgram(shaderProgram);
//        // render the triangle
//        glBindVertexArray(VAOs[0]);
//        glDrawArrays(GL_TRIANGLES, 0, 3);
//        
//        //second
//        glUseProgram(shaderProgram2);
//        // render the triangle
//        glBindVertexArray(VAOs[1]);
//        glDrawArrays(GL_TRIANGLES, 0, 3);
//        
//        // third
//        glUseProgram(shaderProgram2);
//        // render the triangle
//        glBindVertexArray(VAOs[2]);
//        glDrawArrays(GL_TRIANGLES, 0, 3);
//        
//
//        // glfw: swap buffers and poll IO events (keys pressed/released, mouse moved etc.)
//        // -------------------------------------------------------------------------------
//        glfwSwapBuffers(window);
//        glfwPollEvents();
//    }
//
//    // optional: de-allocate all resources once they've outlived their purpose:
//    // ------------------------------------------------------------------------
//    glDeleteVertexArrays(3, VAOs);
//    glDeleteBuffers(3, VBOs);
//    glDeleteProgram(shaderProgram);
//    glDeleteProgram(shaderProgram2);
//
//    // glfw: terminate, clearing all previously allocated GLFW resources.
//    // ------------------------------------------------------------------
//    glfwTerminate();
//    return 0;
//}
//
//// process all input: query GLFW whether relevant keys are pressed/released this frame and react accordingly
//// ---------------------------------------------------------------------------------------------------------
//void processInput(GLFWwindow *window)
//{
//    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
//        glfwSetWindowShouldClose(window, true);
//}
//
//// glfw: whenever the window size changed (by OS or user resize) this callback function executes
//// ---------------------------------------------------------------------------------------------
//void framebuffer_size_callback(GLFWwindow* window, int width, int height)
//{
//    // make sure the viewport matches the new window dimensions; note that width and
//    // height will be significantly larger than specified on retina displays.
//    glViewport(0, 0, width, height);
//}
