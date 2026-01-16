import {
    hyperLayer,
    ifApp,
    ifInputSource,
    ifVar,
    map,
    rule,
    toApp,
    toKey,
    toSetVar,
    withModifier,
    writeToProfile,
} from "karabiner.ts";

writeToProfile("Default", [
    rule("Work PC config")
        .condition(ifVar("__layer", 0))
        .manipulators([
            map("left_command", undefined, "any")
                .description(
                    "map command -> control for window virtual machine",
                )
                .condition(
                    ifApp({
                        bundle_identifiers: ["company.thebrowser.Browser"],
                    }),
                )
                .to("left_control"),
        ]),

    rule("Switch to English while escape Vim Insert Mode")
        .condition(ifInputSource({ language: "en" }).unless())
        .manipulators([
            /*
             * While on Vietnamese Input Source
             * Press kj in vim mode to escape insert mode
             * And also switch to English Input Source
             *
             * Choosing kj instead of the most common jk is because
             * it is more suitable for Vietnamese
             * Example:
             * - jk: nawngjk -> nặngk
             * - kj: nawngkj -> năng<escape>
             *
             * One downside is that the letter k is more common than the letter j
             * and vim mode delays the insert of the first character of the keymap.
             * This makes the delay more explicit when using kj.
             *
             * This config only switches input source, the kj to escape in insert
             * should be mapped in vim.
             *
             */
            map("j")
                .condition(ifVar("vi_kj", 1))
                .to([toKey("j"), toKey("spacebar", "<⌥⌃")]),
            map("k")
                .to([toSetVar("vi_kj", 1), toKey("k")])
                .toDelayedAction(toSetVar("vi_kj", 0), toSetVar("vi_kj", 0))
                .parameters({
                    "basic.to_delayed_action_delay_milliseconds": 1000,
                }),
        ]),

    /*
     * Use MacOS input source switch shortcut instead of select_input_source api
     * bacause of an unfixed error
     * https://karabiner-elements.pqrs.org/docs/json/complex-modifications-manipulator-definition/to/select-input-source/
     *
     * Temporary fix by using toKey("spacebar", "<⌥⌃")
     */
    rule("Non layer keymap")
        .condition(ifVar("__layer", 0))
        .manipulators([
            map("caps_lock", undefined, "any")
                .condition(ifInputSource({ language: "en" }))
                .toHyper({ lazy: true })
                .toIfAlone("escape"),
            map("caps_lock", undefined, "any")
                .condition(ifInputSource({ language: "en" }).unless())
                .toHyper({ lazy: true })
                .toIfAlone([toKey("spacebar", "<⌥⌃"), toKey("escape")]),

            map("v", "⌘⌥⌃⇧")
                .condition(ifInputSource({ language: "vi" }).unless())
                .to("spacebar", "<⌥⌃"),
            map("e", "⌘⌥⌃⇧")
                .condition(ifInputSource({ language: "en" }).unless())
                .to("spacebar", "<⌥⌃"),

            map("return_or_enter", undefined, "any")
                .toHyper({ lazy: true })
                .toIfAlone("return_or_enter"),

            map("escape", undefined, "any").to("caps_lock"),

            map("right_command", null, "any").to("right_control"),

            // Note: use right_command instead
            // map("backslash", null, "any")
            //     .to("right_control", undefined, { lazy: true })
            //     .toIfAlone("backslash"),

            withModifier(
                "⌘⌥⌃⇧",
                "any",
            )({
                h: toKey("left_arrow"),
                l: toKey("right_arrow"),
                k: toKey("up_arrow"),
                j: toKey("down_arrow"),

                // a: toKey("f14", "<⌘"), // RayCast ChatAI
                // q: toKey("f14", "<⌘⌥⌃"), // RayCast Quick Chat

                "[": toKey("home"),
                "]": toKey("end"),
                ".": toKey("page_down"),
                ",": toKey("page_up"),

                // Note: Use esc instead
                // u: toKey("caps_lock"),

                t: toApp("Kitty"),

                "1": toKey("f1"),
                "2": toKey("f2"),
                "3": toKey("f3"),
                "4": toKey("f4"),
                "5": toKey("f5"),
                "6": toKey("f6"),
                "7": toKey("f7"),
                "8": toKey("f8"),
                "9": toKey("f9"),
                "0": toKey("f10"),
                "-": toKey("f11"),
                "=": toKey("f12"),

                c: toKey("f20", "⇧"), // Clipboard History
                "`": toKey("q", "⌘⌃"), // Lock Screen
            }),
        ]),

    hyperLayer("o", "Open App")
        .leaderMode({ escape: ["caps_lock", "return_or_enter"] })
        .notification()
        .manipulators({
            o: toApp("Obsidian"),

            j: toApp("IntelliJ Idea"),
            w: toApp("Webstorm"),
            f: toApp("Firefox"),

            z: toApp("Zalo"),
            m: toApp("Mail"),
            p: toApp("Postman"),
        }),

    hyperLayer("w", "Manage Window")
        .leaderMode({ sticky: true, escape: ["caps_lock", "return_or_enter"] })
        .notification()
        .manipulators({
            h: toKey("f13"), // left half
            m: toKey("f13", "<⌥⇧"), // almost maximize
            a: toKey("f13", "<⌥⌃"), // almost maximize
            c: toKey("f13", "<⌘⌃"), // center
            n: toKey("f13", "<⌃⇧"), // next display
            p: toKey("f13", "<⌘"), // previous display
            r: toKey("f13", "<⌘⇧"), // reasonable size
            l: toKey("f13", "<⌥"), // right half
            f: toKey("f13", "<⌘⌥"), // almost maximize
            j: toKey("f13", "<⇧"), // bottom half
            k: toKey("f13", "<⌃"), // top half
            // m: toKey("f13", "<⌘⌥⌃⇧"), // almost maximize
        }),

    hyperLayer("a", "Use AI")
        .leaderMode({ escape: ["caps_lock", "return_or_enter"] })
        .notification()
        .manipulators({
            a: toKey("f14", "<⌘⌥⌃"), // Last used AI chat

            s: toKey("f14", "<⌘"), // Searching AI

            w: toKey("f14", "<⌥"), // Writing AI

            c: toKey("f14", "<⌃"), // Coding AI
        }),
]);
