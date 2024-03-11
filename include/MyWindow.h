#pragma once
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>

class MyWindow {
    public:
        MyWindow();
        ~MyWindow();
        unsigned int SCR_WIDTH = 800;
        unsigned int SCR_HEIGHT = 600;
        void MoveMouse(GLFWwindow* window, double xposIn, double yposIn);
        void ResizeWindow(GLFWwindow* window, int width, int height);
    private:
        bool firstMouse = true;
        float lastX = (float)SCR_WIDTH / 2.0f;
        float lastY = (float)SCR_HEIGHT / 2.0f;
};
