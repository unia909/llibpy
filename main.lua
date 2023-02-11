local ffi = require "ffi"
local gl, glfw = unpack(require "luagl.ffilib")
local glm = require "luagl.main"

local EX_SOFTWARE = 70
local EX_OSERR    = 71

if glfw.glfwInit() == 0 then
    print("glfwInit failed")
    os.exit(EX_OSERR)
end

local GLFW_CONTEXT_VERSION_MAJOR = 0x00022002
local GLFW_CONTEXT_VERSION_MINOR = 0x00022003
local GLFW_OPENGL_PROFILE = 0x00022008
local GLFW_OPENGL_CORE_PROFILE = 0x00032001

glfw.glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
glfw.glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0)
--glfw.glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)

local window = glfw.glfwCreateWindow(640, 480, "Hello World", nil, nil)
if not window then
    print("glfwCreateWindow failed")
    glfw.glfwTerminate()
    os.exit(EX_OSERR)
end
glfw.glfwMakeContextCurrent(window)
glfw.glfwSetFramebufferSizeCallback(window, function(window, width, height)
    gl.glViewport(0, 0, width, height)
end)

if type(gl) == "table" and type(gl.__win_init) == "function" then
    gl:__win_init()
end

local vertexShader = glm.shader(glm.get("GL_VERTEX_SHADER"), [[#version 130
in vec2 pos;

void main()
{
    gl_Position = vec4(pos, 0.0, 1.0);
}]])

if not vertexShader:success() then
    print(vertexShader:getLog())
    os.exit(EX_SOFTWARE)
end

local fragmentShader = glm.shader(glm.get("GL_FRAGMENT_SHADER"), [[#version 130
void main()
{
    gl_FragColor = vec4(1.0, 0.5, 0.2, 1.0);
}]])

if not fragmentShader:success() then
    print(fragmentShader:getLog())
    os.exit(EX_SOFTWARE)
end

local shaderProgram = glm.program(vertexShader, fragmentShader)

if not shaderProgram:success() then
    print(shaderProgram:getLog())
    os.exit(EX_SOFTWARE)
end

vertexShader = nil
fragmentShader = nil

local vertices = ffi.new("float[6]", {
    -0.5, -0.5,
    0.5, -0.5,
    0.0, 0.5,
})
local vbo = ffi.new("uint[1]")
gl.glGenBuffers(1, vbo)

gl.glBindBuffer(glm.get("GL_ARRAY_BUFFER"), vbo[0])
gl.glBufferData(glm.get("GL_ARRAY_BUFFER"), ffi.sizeof(vertices), vertices, glm.get("GL_STATIC_DRAW"))

local vao = ffi.new("uint[1]")
gl.glGenVertexArrays(1, vao)

gl.glBindVertexArray(vao[0])
gl.glVertexAttribPointer(0, 2, glm.get("GL_FLOAT"), false, 2 * ffi.sizeof("float"), nil)
gl.glEnableVertexAttribArray(0)

gl.glBindBuffer(glm.get("GL_ARRAY_BUFFER"), 0)
gl.glBindVertexArray(0)

local PollEvents = function()
    glfw.glfwPollEvents()
end
jit.off(PollEvents)

while glfw.glfwWindowShouldClose(window) == 0 do
    gl.glClearColor(0.2, 0.3, 0.3, 0.0)
    gl.glClear(glm.get("GL_COLOR_BUFFER_BIT"))
    shaderProgram:use()
    gl.glBindVertexArray(vao[0])
    gl.glDrawArrays(glm.get("GL_TRIANGLES"), 0, 3)

    glfw.glfwSwapBuffers(window)
    PollEvents()
end

glfw.glfwDestroyWindow(window)
