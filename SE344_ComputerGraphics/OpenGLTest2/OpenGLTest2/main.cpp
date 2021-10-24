//#include <glad/glad.h>
//#include <GLFW/glfw3.h>
//
//#include <iostream>
//
//void framebuffer_size_callback(GLFWwindow* window, int width, int height);
//void processInput(GLFWwindow *window);
//
//// settings
//const unsigned int SCR_WIDTH = 800;
//const unsigned int SCR_HEIGHT = 600;
//
//const char *vertexShaderSource ="#version 330 core\n"
//    "layout (location = 0) in vec3 aPos;\n"
//    "layout (location = 1) in vec3 aColor;\n"
//    "out vec3 ourColor;\n"
//    "void main()\n"
//    "{\n"
//    "   gl_Position = vec4(aPos, 1.0);\n"
//    "   ourColor = aColor;\n"
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
//void drawRainbowTriangle(unsigned int shaderProgram,unsigned int VAOs[],int size){
//    for(int i=0;i<size;i++){
//        glUseProgram(shaderProgram);
//        glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
//        glBindVertexArray(VAOs[i]);
//        glDrawArrays(GL_TRIANGLES, 0, 3);
//    }
//}
//
//void setUpTriangle(unsigned int VAOs[], unsigned int VBOs[], int index,float triangle[]){
//    glBindVertexArray(VAOs[index]);    // note that we bind to a different VAO now
//    glBindBuffer(GL_ARRAY_BUFFER, VBOs[index]);    // and a different VBO
////    glBufferData(GL_ARRAY_BUFFER, sizeof(triangle), triangle, GL_STATIC_DRAW);
//    glBufferData(GL_ARRAY_BUFFER, 36, triangle, GL_STATIC_DRAW);
//    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)0); // because the vertex data is tightly packed we can also specify 0 as the vertex attribute's stride to let OpenGL figure it out
//    // color attribute
//    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(3 * sizeof(float)));
//    glEnableVertexAttribArray(0);
//
//}
//
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
//
//    // check for shader compile errors
//    int success;
//    char infoLog[512];
//    glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &success);
//    if (!success)
//    {
//        glGetShaderInfoLog(vertexShader, 512, NULL, infoLog);
//        std::cout << "ERROR::SHADER::VERTEX::COMPILATION_FAILED\n" << infoLog << std::endl;
//    }else std::cout << "SHADER::VERTEX::COMPILATION_OK::OK"<<std::endl;
//    // fragment shader
//    unsigned int fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
//    glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
//    glCompileShader(fragmentShader);
//    // check for shader compile errors
//    glGetShaderiv(fragmentShader, GL_COMPILE_STATUS, &success);
//    if (!success)
//    {
//        glGetShaderInfoLog(fragmentShader, 512, NULL, infoLog);
//        std::cout << "ERROR::SHADER::FRAGMENT::COMPILATION_FAILED\n" << infoLog << std::endl;
//    }else std::cout << "SHADER::FRAGMENT::COMPILATION_OK"<<std::endl;
//    // link shaders
//    unsigned int shaderProgram = glCreateProgram();
//    glAttachShader(shaderProgram, vertexShader);
//    glAttachShader(shaderProgram, fragmentShader);
//    glLinkProgram(shaderProgram);
//    // check for linking errors
//    glGetProgramiv(shaderProgram, GL_LINK_STATUS, &success);
//    if (!success) {
//        glGetProgramInfoLog(shaderProgram, 512, NULL, infoLog);
//        std::cout << "ERROR::SHADER::PROGRAM::LINKING_FAILED\n" << infoLog << std::endl;
//    }else std::cout << "SHADER::PROGRAM::LINKING_OK"<<std::endl;
//    glDeleteShader(vertexShader);
//    glDeleteShader(fragmentShader);
//
//    // set up vertex data (and buffer(s)) and configure vertex attributes
//    // ------------------------------------------------------------------
//
//    float rainbowTriangle1[]={
//        0.2,    0,   0,    1,0,0,
//        1,      0,   0,    0,1,0,
//        -0.2, 0.5, 0.2,    0,0,1
//    };
//    float rainbowTriangle2[]={
//        0,    0.2,   0,    1,0,0,
//        0,      1,   0,    0,1,0,
//        -0.5, -0.2, 0.2,    0,0,1
//    };
//    float rainbowTriangle3[]={
//        -0.2,   0,   0,    1,0,0,
//        -1,     0,   0,    0,1,0,
//        0.2, -0.5, 0.2,    0,0,1
//    };
//    float rainbowTriangle4[]={
//        0,   -0.2,   0,    1,0,0,
//        0,     -1,   0,    0,1,0,
//        0.5,  0.2, 0.2,    0,0,1
//    };
//
////    unsigned int VBOs[4], VAOs[4];
////    glGenVertexArrays(4, VAOs); // we can also generate multiple VAOs or buffers at the same time
////    glGenBuffers(4, VBOs);
////    setUpTriangle(VAOs, VBOs, 0, rainbowTriangle1);
////    setUpTriangle(VAOs, VBOs, 1, rainbowTriangle2);
////    setUpTriangle(VAOs, VBOs, 2, rainbowTriangle3);
////    setUpTriangle(VAOs, VBOs, 3, rainbowTriangle4);
//
//
//
//
//    unsigned int VBOs[4], VAOs[4];
//    glGenVertexArrays(4, VAOs);
//    glGenBuffers(4, VBOs);
//    // bind the Vertex Array Object first, then bind and set vertex buffer(s), and then configure vertex attributes(s).
//    glBindVertexArray(VAOs[0]);
//    glBindBuffer(GL_ARRAY_BUFFER, VBOs[0]);
//    glBufferData(GL_ARRAY_BUFFER, sizeof(rainbowTriangle1), rainbowTriangle1, GL_STATIC_DRAW);
//    // position attribute
//    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)0);
//    glEnableVertexAttribArray(0);
//    // color attribute
//    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(3 * sizeof(float)));
//    glEnableVertexAttribArray(1);
//    glBindVertexArray(0);
//    glUseProgram(shaderProgram);
//    
//    
//    glBindVertexArray(VAOs[1]);
//    glBindBuffer(GL_ARRAY_BUFFER, VBOs[1]);
//    glBufferData(GL_ARRAY_BUFFER, sizeof(rainbowTriangle2), rainbowTriangle2, GL_STATIC_DRAW);
//    // position attribute
//    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)0);
//    glEnableVertexAttribArray(0);
//    // color attribute
//    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(3 * sizeof(float)));
//    glEnableVertexAttribArray(1);
//    glBindVertexArray(0);
//    glUseProgram(shaderProgram);
//    
//    glBindVertexArray(VAOs[2]);
//    glBindBuffer(GL_ARRAY_BUFFER, VBOs[2]);
//    glBufferData(GL_ARRAY_BUFFER, sizeof(rainbowTriangle3), rainbowTriangle3, GL_STATIC_DRAW);
//    // position attribute
//    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)0);
//    glEnableVertexAttribArray(0);
//    // color attribute
//    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(3 * sizeof(float)));
//    glEnableVertexAttribArray(1);
//    glBindVertexArray(0);
//    glUseProgram(shaderProgram);
//    
//    
//    glBindVertexArray(VAOs[3]);
//    glBindBuffer(GL_ARRAY_BUFFER, VBOs[3]);
//    glBufferData(GL_ARRAY_BUFFER, sizeof(rainbowTriangle4), rainbowTriangle4, GL_STATIC_DRAW);
//    // position attribute
//    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)0);
//    glEnableVertexAttribArray(0);
//    // color attribute
//    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(3 * sizeof(float)));
//    glEnableVertexAttribArray(1);
//    glBindVertexArray(0);
//    glUseProgram(shaderProgram);
//    
//    
//    
//    
//    
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
//
////        drawRainbowTriangle(shaderProgram, VAOs, 4);
//
////
////
//        glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
//        glClear(GL_COLOR_BUFFER_BIT);
//
//        // render the triangle
//        glUseProgram(shaderProgram);
//        glBindVertexArray(VAOs[0]);
//        glDrawArrays(GL_TRIANGLES, 0, 3);
//        glUseProgram(shaderProgram);
//        glBindVertexArray(VAOs[1]);
//        glDrawArrays(GL_TRIANGLES, 0, 3);
//        glBindVertexArray(VAOs[2]);
//        glDrawArrays(GL_TRIANGLES, 0, 3);
//        glBindVertexArray(VAOs[3]);
//        glDrawArrays(GL_TRIANGLES, 0, 3);
//
//        // glfw: swap buffers and poll IO events (keys pressed/released, mouse moved etc.)
//        // -------------------------------------------------------------------------------
//        glfwSwapBuffers(window);
//        glfwPollEvents();
//    }
//
//    // optional: de-allocate all resources once they've outlived their purpose:
//    // ------------------------------------------------------------------------
////    glDeleteVertexArrays(4, VAOs);
////    glDeleteBuffers(4, VBOs);
//    glDeleteVertexArrays(3, VAOs);
//    glDeleteBuffers(3, VBOs);
//    glDeleteProgram(shaderProgram);
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
////     make sure the viewport matches the new window dimensions; note that width and
//    // height will be significantly larger than specified on retina displays.
//    glViewport(0, 0, width, height);
//}
