import {
    hyperLayer,
    ifVar,
    layer,
    map,
    rule,
    to$,
    toApp,
    toConsumerKey,
    toGenericDesktop,
    toInputSource,
    toKey,
    toSleepSystem,
    withCondition,
    withModifier,
    writeToProfile,
} from "karabiner.ts";

writeToProfile("Default", [
    rule("Non layer keymap")
        .condition(ifVar("__layer", 0))
        .manipulators([
            map("caps_lock", undefined, "any")
                .toHyper({ lazy: true })
                .toIfAlone("escape"),
            map("return_or_enter", undefined, "any")
                .toHyper({ lazy: true })
                .toIfAlone("return_or_enter"),

            map("backslash", null, "any")
                .to("right_control", undefined, { lazy: true })
                .toIfAlone("backslash"),

            withModifier(
                "⌘⌥⌃⇧",
                "any",
            )({
                h: toKey("left_arrow"),
                l: toKey("right_arrow"),
                k: toKey("up_arrow"),
                j: toKey("down_arrow"),

                "[": toKey("home"),
                "]": toKey("end"),
                ".": toKey("page_down"),
                ",": toKey("page_up"),

                u: toKey("caps_lock"),

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

                c: toKey("f20", "⇧"),

                "/": toKey("q", "⌘⌃"), // lock screen

                i: toKey("spacebar", "⌥⌃"),
                v: toInputSource({ language: "vi" }),
                e: toInputSource({ language: "en" }),
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
