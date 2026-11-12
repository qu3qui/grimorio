// gradle/libs.versions.toml
// [versions]
//   detekt = "1.23.8"
//   ktlintGradle = "12.1.2"
//   kover = "0.9.1"
// [plugins]
//   detekt = { id = "io.gitlab.arturbosch.detekt", version.ref = "detekt" }
//   ktlint = { id = "org.jlleitschuh.gradle.ktlint", version.ref = "ktlintGradle" }
//   kover = { id = "org.jetbrains.kotlinx.kover", version.ref = "kover" }
//
// Root build.gradle.kts: add the three aliases with `apply false`.

// app/build.gradle.kts
plugins {
    // ...android + kotlin plugins
    alias(libs.plugins.detekt)
    alias(libs.plugins.ktlint)
    alias(libs.plugins.kover)
}

android {
    // ...
    lint {
        // Zero-warnings policy. Existing projects: run `./gradlew updateLintBaseline` once.
        warningsAsErrors = true
        abortOnError = true
        baseline = file("lint-baseline.xml")
    }
}

ktlint {
    version.set("1.5.0")
    android.set(true)
}

detekt {
    buildUponDefaultConfig = true
    config.setFrom(rootProject.file("config/detekt/detekt.yml"))
    baseline = file("detekt-baseline.xml") // existing projects: `./gradlew detektBaseline`
}

// Coverage gate (new projects). Existing projects may start report-only and add this later.
kover {
    reports {
        verify {
            rule { minBound(70) }
        }
    }
}
