#include <glad/glad.h>
#include <GLFW/glfw3.h>

#include <iostream>
#include <cmath>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include <iostream>
using namespace std;

void framebuffer_size_callback(GLFWwindow* window, int width, int height);
void processInput(GLFWwindow *window);

// settings
const unsigned int SCR_WIDTH = 800;
const unsigned int SCR_HEIGHT = 800;

const char *vertexShaderSource = "#version 330 core\n"
    "layout (location = 0) in vec3 aPos;\n"
    "void main()\n"
    "{\n"
    "   gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);\n"
    "}\0";

const char *vertexShaderSourceRainbow ="#version 330 core\n"
    "layout (location = 0) in vec3 aPos;\n"
    "layout (location = 1) in vec3 aColor;\n"
    "out vec3 ourColor;\n"
    "uniform float xOffset;"
    "void main()\n"
    "{\n"
    "   gl_Position = vec4(aPos, 1.0);\n"
    "   ourColor = aColor;\n"
    "}\0";
const char *fragmentShader1Source = "#version 330 core\n"
    "out vec4 FragColor;\n"
    "uniform vec4 ourColor;\n"
    "void main()\n"
    "{\n"
    "   FragColor = ourColor;\n"
    "}\n\0";

const char *rainbowFragmentShaderSource = "#version 330 core\n"
    "out vec4 FragColor;\n"
    "in vec3 ourColor;\n"
    "void main()\n"
    "{\n"
    "   FragColor = vec4(ourColor, 1.0f);\n"
    "}\n\0";

void drawTriangle(unsigned int shaderProgram,unsigned int VAOs[],int index, int vertexColorLocation, float r, float g, float b, float a,int flag){
    // draw triangle in while loop
    glUseProgram(shaderProgram);
    glBindVertexArray(VAOs[index]);
    glUniform4f(vertexColorLocation, r, g, b, a);
    if(flag==0)glPolygonMode(GL_FRONT_AND_BACK, GL_FILL); // set drawing to line
    else glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
    glDrawArrays(GL_TRIANGLES, 0, 3);
}

void drawRainbowTriangle(unsigned int shaderProgram,unsigned int VAOs[],unsigned int VBOs[],float triangle[],int index){
    glUseProgram(shaderProgram);
    glBindVertexArray(VAOs[index]);

    glBindBuffer(GL_ARRAY_BUFFER,VAOs[index]);
    glBufferData(GL_ARRAY_BUFFER, 36, triangle, GL_STATIC_DRAW);

    // position attribute
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);
    // color attribute
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(3 * sizeof(float)));
    glEnableVertexAttribArray(1);

}

void setUpTriangle(unsigned int VAOs[], unsigned int VBOs[], int index,float triangle[]){
    glBindVertexArray(VAOs[index]);    // note that we bind to a different VAO now
    glBindBuffer(GL_ARRAY_BUFFER, VBOs[index]);    // and a different VBO
//    glBufferData(GL_ARRAY_BUFFER, sizeof(triangle), triangle, GL_STATIC_DRAW);
    glBufferData(GL_ARRAY_BUFFER, 36, triangle, GL_STATIC_DRAW);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, (void*)0); // because the vertex data is tightly packed we can also specify 0 as the vertex attribute's stride to let OpenGL figure it out
    glEnableVertexAttribArray(0);
}

void calRGB(float Ar,float Ag, float Ab, float Br, float Bg, float Bb, float &calr, float &calg, float &calb,float timeValue){
    calr= (Ar+Br)/2 +(Br-Ar)*sin(timeValue)/2;
    calg= (Ag+Bg)/2 +(Bg-Ag)*sin(timeValue)/2;
    calb= (Ab+Bb)/2 +(Bb-Ab)*sin(timeValue)/2;
}

int main()
{
    // glfw: initialize and configure
    // ------------------------------
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

#ifdef __APPLE__
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
#endif

    // glfw window creation
    // --------------------
    GLFWwindow* window = glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "LearnOpenGL", NULL, NULL);
    if (window == NULL)
    {
        std::cout << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

    // glad: load all OpenGL function pointers
    // ---------------------------------------
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
    {
        std::cout << "Failed to initialize GLAD" << std::endl;
        return -1;
    }


    // build and compile our shader program
    // ------------------------------------
    // we skipped compile log checks this time for readability (if you do encounter issues, add the compile-checks! see previous code samples)
    unsigned int vertexShader = glCreateShader(GL_VERTEX_SHADER);
    unsigned int vertexShaderRainbow = glCreateShader(GL_VERTEX_SHADER);
    unsigned int fragmentShaderOrange = glCreateShader(GL_FRAGMENT_SHADER); // the first fragment shader that outputs the color orange
    unsigned int fragmentShaderYellow = glCreateShader(GL_FRAGMENT_SHADER); // the second fragment shader that outputs the color yellow
    unsigned int fragmentShaderRainbow = glCreateShader(GL_FRAGMENT_SHADER);



    unsigned int shaderProgramOrange = glCreateProgram();
    unsigned int shaderProgramYellow = glCreateProgram(); // the second shader program
    unsigned int shaderProgramRainbow = glCreateProgram();


    glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
    glCompileShader(vertexShader);
    glShaderSource(vertexShaderRainbow, 1, &vertexShaderSourceRainbow, NULL);
    glCompileShader(vertexShaderRainbow);


    int success;
    char infoLog[512];
    glGetShaderiv(vertexShaderRainbow, GL_COMPILE_STATUS, &success);
    if (!success)
    {
        glGetShaderInfoLog(vertexShaderRainbow, 512, NULL, infoLog);
        std::cout << "ERROR::SHADER::VERTEX::COMPILATION_FAILED\n" << infoLog << std::endl;
    }


    glShaderSource(fragmentShaderOrange, 1, &fragmentShader1Source, NULL); //?
    glCompileShader(fragmentShaderOrange);
    glCompileShader(fragmentShaderYellow);
    glShaderSource(fragmentShaderRainbow, 1, &rainbowFragmentShaderSource, NULL);
    glCompileShader(fragmentShaderRainbow);
    glGetShaderiv(fragmentShaderRainbow, GL_COMPILE_STATUS, &success);
        if (!success)
        {
            glGetShaderInfoLog(fragmentShaderRainbow, 512, NULL, infoLog);
            std::cout << "ERROR::SHADER::FRAGMENT::COMPILATION_FAILED\n" << infoLog << std::endl;
        }

    // link the first program object
    glAttachShader(shaderProgramOrange, vertexShader);
    glAttachShader(shaderProgramOrange, fragmentShaderOrange);
    glLinkProgram(shaderProgramOrange);
    // then link the second program object using a different fragment shader (but same vertex shader)
    // this is perfectly allowed since the inputs and outputs of both the vertex and fragment shaders are equally matched.
    glAttachShader(shaderProgramYellow, vertexShader);
    glAttachShader(shaderProgramYellow, fragmentShaderYellow);
    glLinkProgram(shaderProgramYellow);

    glAttachShader(shaderProgramRainbow, vertexShaderRainbow);
    glAttachShader(shaderProgramRainbow, fragmentShaderRainbow);
    glLinkProgram(shaderProgramRainbow);

    glGetProgramiv(shaderProgramRainbow, GL_LINK_STATUS, &success);
    if (!success) {
        glGetProgramInfoLog(shaderProgramRainbow, 512, NULL, infoLog);
        std::cout << "ERROR::SHADER::PROGRAM::LINKING_FAILED\n" << infoLog << std::endl;
    }



    // set up vertex data (and buffer(s)) and configure vertex attributes
    // ------------------------------------------------------------------



    float firstTriangle[] = {
        -0.45f, -0.3897f, 0.0f,  // left
        0.45f,  -0.3897f, 0.0f,  // right
        0.0f, 0.3897f, 0.0f   // top
    };
    float secondTriangle1[] = {
        0.05f, -0.33197, 0.0f,  // left
        0.25f,  -0.3897, 0.0f,  // right
        0.15f, 0.01445, 0.0f   // top
    };
    float secondTriangle2[] = {
        -0.35f, -0.2165, 0.0f,  // left
        -0.2,  -0.07216, 0.0f,  // right
        0.05f, -0.331965, 0.0f   // top
    };
    float secondTriangle3[] = {
        -0.2,  -0.07216, 0.0f,  // left
        0.15f, 0.01445, 0.0f,  // right
        0.1, 0.2165, 0.0f   // top
    };
    float thirdTriangle[] = {
        -0.03333,  -0.24536, 0.0f,
        0.1167, -0.101, 0.0f,
        -0.0833,  -0.0433, 0.0f,
    };
    float rainbowTriangle[]={
        -0.03333,  -0.24536, 0.0f,  0.905f, 0.22745f, 0.43529f,  // bottom right
        0.1167, -0.101, 0.0f,       0.48627f, 0.859f, 0.886274f,  // bottom left
        -0.0833,  -0.0433, 0.0f,    0.29f, 0.39216f, 0.921568f   // top
    };



    unsigned int VBOs[9], VAOs[9];
    glGenVertexArrays(9, VAOs); // we can also generate multiple VAOs or buffers at the same time
    glGenBuffers(9, VBOs);
    // first triangle setup
    // --------------------
    setUpTriangle(VAOs, VBOs, 0, firstTriangle);
    // glBindVertexArray(0); // no need to unbind at all as we directly bind a different VAO the next few lines
    // second triangle setup
    // ---------------------
    setUpTriangle(VAOs, VBOs, 1, secondTriangle1);

    // third
    setUpTriangle(VAOs, VBOs, 2, secondTriangle2);

    // fourth

    setUpTriangle(VAOs, VBOs, 3, secondTriangle3);

    setUpTriangle(VAOs, VBOs, 4, thirdTriangle);

    setUpTriangle(VAOs, VBOs, 5, rainbowTriangle);


    unsigned int VBO, VAO;
    glGenVertexArrays(1, &VAO);
    glGenBuffers(1, &VBO);
    // bind the Vertex Array Object first, then bind and set vertex buffer(s), and then configure vertex attributes(s).
    glBindVertexArray(VAO);

    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(rainbowTriangle), rainbowTriangle, GL_STATIC_DRAW);

    // position attribute
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);
    // color attribute
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(3 * sizeof(float)));
    glEnableVertexAttribArray(1);



    // render loop
    // -----------
    while (!glfwWindowShouldClose(window))
    {
        //prepare for the color data
        float timeValue = glfwGetTime();
        float calr,calg,calb; // go between green to red
        float calr1,calg1,calb1; // go
        float calr2,calg2,calb2;
        float calr3,calg3,calb3; // for background
        calRGB(rainbowTriangle[3], rainbowTriangle[4], rainbowTriangle[5], rainbowTriangle[9], rainbowTriangle[10], rainbowTriangle[11], calr, calg, calb, timeValue);
        calRGB(rainbowTriangle[15], rainbowTriangle[16], rainbowTriangle[17], rainbowTriangle[3], rainbowTriangle[4], rainbowTriangle[5], calr1, calg1, calb1, timeValue);
        calRGB(rainbowTriangle[9], rainbowTriangle[10], rainbowTriangle[11], rainbowTriangle[15], rainbowTriangle[16], rainbowTriangle[17], calr2, calg2, calb2, timeValue);
        calRGB(0.1137f, 0.11255f, 0.25294f, 0, 0, 0, calr3, calg3, calb3, timeValue);



        // input
        // -----
        processInput(window);
        glClearColor(calr3,calg3,calb3, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);
        int vertexColorLocation = glGetUniformLocation(shaderProgramOrange, "ourColor");
        glm::mat4 transform = glm::mat4(1.0f); // make sure to initialize matrix to identity matrix first
        transform = glm::translate(transform, glm::vec3(0.5f, -0.5f, 0.0f));
        transform = glm::rotate(transform, (float)glfwGetTime(), glm::vec3(0.0f, 0.0f, 1.0f));



        // render the first trriangle
        drawTriangle(shaderProgramOrange, VAOs,0, vertexColorLocation, calr, calg, calb, 1.0, 1);

        // when we draw the second triangle we want to use a different shader program so we switch to the shader program with our yellow fragment shader.
        drawTriangle(shaderProgramYellow, VAOs,1, vertexColorLocation, calr, calg, calb, 1, 0);

        // third one
        drawTriangle(shaderProgramYellow, VAOs,2, vertexColorLocation,calr1, calg1, calb1, 1, 0);

        drawTriangle(shaderProgramYellow, VAOs,3, vertexColorLocation, calr2, calg2, calb2, 1, 0);
        // draw the center rainbow triangle.
        glUseProgram(shaderProgramRainbow);
        glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
        glBindVertexArray(VAO);
        glDrawArrays(GL_TRIANGLES, 0, 3);




        // glfw: swap buffers and poll IO events (keys pressed/released, mouse moved etc.)
        // -------------------------------------------------------------------------------
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    // optional: de-allocate all resources once they've outlived their purpose:
    // ------------------------------------------------------------------------
    glDeleteVertexArrays(4, VAOs);
    glDeleteBuffers(4, VBOs);
    glDeleteVertexArrays(1, &VAO);
    glDeleteBuffers(1, &VBO);
    glDeleteProgram(shaderProgramOrange);
    glDeleteProgram(shaderProgramYellow);
    glDeleteProgram(shaderProgramRainbow);
    // glfw: terminate, clearing all previously allocated GLFW resources.
    // ------------------------------------------------------------------
    glfwTerminate();
    return 0;
}

// process all input: query GLFW whether relevant keys are pressed/released this frame and react accordingly
// ---------------------------------------------------------------------------------------------------------
void processInput(GLFWwindow *window)
{
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
}

// glfw: whenever the window size changed (by OS or user resize) this callback function executes
// ---------------------------------------------------------------------------------------------
void framebuffer_size_callback(GLFWwindow* window, int width, int height)
{
    // make sure the viewport matches the new window dimensions; note that width and
    // height will be significantly larger than specified on retina displays.
    glViewport(0, 0, width, height);
}
