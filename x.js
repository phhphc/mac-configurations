const lo = "a".charCodeAt(0)
const hi = 'z'.charCodeAt(0)
for (let i = lo; i <= hi; i++) {
    c = String.fromCharCode(i)
    s = `{
        "conditions": [
            {
                "name": "hyper_modified",
                "type": "variable_if",
                "value": 1
            }
        ],
        "from": {
            "key_code": "${c}"
        },
        "to": [
            {
                "key_code": "${c}",
                "modifiers": [
                    "left_shift",
                    "left_control",
                    "left_alt",
                    "left_gui"
                ]
            }
        ],
        "type": "basic"
    },`
    console.log(s)
}