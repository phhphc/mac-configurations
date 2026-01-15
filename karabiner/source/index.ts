import {
    hyperLayer,
    ifApp,
    ifInputSource,
    ifVar,
    map,
    rule,
    toApp,
    toKey,
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
            map(";")
                .condition(ifInputSource({ language: "en" }))
                .to("escape"),
            map(";")
                .condition(ifInputSource({ language: "en" }).unless())
                .to([toKey("spacebar", "<⌥⌃"), toKey("escape")]),

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

                a: toKey("f14", "<⌘"), // RayCast ChatAI
                q: toKey("f14", "<⌥"), // RayCast Quick Chat

                "[": toKey("home"),
                "]": toKey("end"),
                ".": toKey("page_down"),
                ",": toKey("page_up"),

                // Note: Use esc instead
                // u: toKey("caps_lock"),

                ";": toKey(";"),

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
]);
