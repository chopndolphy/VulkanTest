#include "VulkanApplication.h"

#include "MyWindow.h"

VulkanApplication::VulkanApplication() {
    initWindow();
    initVulkan();
}
VulkanApplication::~VulkanApplication() {
    cleanUp();
}
void VulkanApplication::Run() {
    runMainLoop();
}
void VulkanApplication::initWindow() {
    myWindow = new MyWindow();

    glfwInit();
    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
    window = glfwCreateWindow(myWindow->SCR_WIDTH, myWindow->SCR_HEIGHT, "Vulkan", nullptr, nullptr);
}
void VulkanApplication::initVulkan() {

}
void VulkanApplication::runMainLoop() {
    while (!glfwWindowShouldClose(window)) {
        glfwPollEvents();
    }
}
void VulkanApplication::cleanUp() {
    glfwDestroyWindow(window);
    glfwTerminate();
    delete myWindow;
}