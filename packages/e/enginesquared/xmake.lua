package("enginesquared")
    set_kind("library")
    set_description("The enginesquaredcore package")
    add_deps("entt v3.15.0")
    add_deps("gtest v1.17.0")
    add_deps("spdlog v1.16.0")
    add_deps("tinyobjloader v2.0.0rc13")
    add_deps("glm 1.0.1")
    add_deps("glfw 3.4")
    add_deps("fmt 12.1.0")
    add_deps("stb 2025.03.14")
    add_deps("joltphysics v5.4.0")
    add_deps("miniaudio 0.11.23")
    add_deps("rmlui >=6.0")
    add_deps("lodepng 2025.05.06")
    add_deps("wgpu-native ^24.0.0")
    add_deps("glfw3webgpu v1.3.0-alpha")

    add_urls("https://github.com/EngineSquared/EngineSquared.git")

    add_versions("v0.1.0", "e6b7ea2cf6aa49c5d45be7eff31aecd529b4cfd1")
    add_versions("v0.2.0", "fc16288087a8d3b6387329daca73457061b62e76")
    add_versions("webgpu", "a9eaf4e83e0077d288ece929556de7258ce76510")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        -- assert(package:check_cxxsnippets({test = [[
        --     void test(int args, char** argv) {
        --         ES::Engine::Core core;

        --         core.RunSystems();
        --     }
        -- ]]}, {configs = {languages = "cxx20"}, includes = {"Core.hpp"}}))
    end)
