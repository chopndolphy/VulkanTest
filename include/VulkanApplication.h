#pragma once

#include <vulkan/vulkan.h>

#define GLFW_INCLUDE_VULKAN
#include <GLFW/glfw3.h>

#include <iostream>
#include <stdexcept>
#include <cstdlib>

class MyWindow;

class VulkanApplication {
    public:
        VulkanApplication();
        ~VulkanApplication();
        void Run();
    private:
        GLFWwindow* window;
        MyWindow* myWindow;

        void initWindow();
        void initVulkan();
        void runMainLoop();
        void cleanUp();
};