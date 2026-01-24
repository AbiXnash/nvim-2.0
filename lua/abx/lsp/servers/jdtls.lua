return {
    cmd = {
        "jdtls",
        "--java-executable",
        vim.fn.expand("$HOME") .. "/.sdkman/candidates/java/current/bin/java",
        "--jvm-arg=-Xmx4g",
        "--jvm-arg=-XX:+UseG1GC",
        "--jvm-arg=-XX:+UseStringDeduplication",
    },
    settings = {
        java = {
            format = {
                settings = {
                    url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse/google-java-format.xml",
                },
            },
            completion = {
                importGradleDependencies = true,
                overwrite = true,
                guessMethodArguments = true,
                staticFinal = true,
                fallbackFilter = {
                    "java",
                    "javax",
                    "kotlin",
                    "scala",
                },
            },
            signatureHelp = {
                enabled = true,
            },
            contentProvider = {
                preferred = "fernflower",
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value()}}",
                },
                hashCodeEquals = {
                    useJavaObjectsUtil = true,
                },
            },
            autocomplete = {
                enabled = true,
                guessMethodArguments = true,
            },
            import = {
                maven = {
                    enabled = true,
                },
                gradle = {
                    enabled = true,
                },
            },
        },
    },
    init_options = {
        bundles = {},
    },
}
