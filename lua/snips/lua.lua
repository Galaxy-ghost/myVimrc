---@diagnostic disable: unused-local, undefined-global
-- =========== builtin function for luasnip ===================
-- s      = require("luasnip.nodes.snippet").S
-- sn     = require("luasnip.nodes.snippet").SN
-- t      = require("luasnip.nodes.textNode").T
-- f      = require("luasnip.nodes.functionNode").F
-- i      = require("luasnip.nodes.insertNode").I
-- c      = require("luasnip.nodes.choiceNode").C
-- d      = require("luasnip.nodes.dynamicNode").D
-- r      = require("luasnip.nodes.restoreNode").R
-- l      = require("luasnip.extras").lambda
-- rep    = require("luasnip.extras").rep
-- p      = require("luasnip.extras").partial
-- m      = require("luasnip.extras").match
-- n      = require("luasnip.extras").nonempty
-- dl     = require("luasnip.extras").dynamic_lambda
-- fmt    = require("luasnip.extras.fmt").fmt
-- fmta   = require("luasnip.extras.fmt").fmta
-- conds  = require("luasnip.extras.expand_conditions")
-- types  = require("luasnip.util.types")
-- events = require("luasnip.util.events")
-- parse  = require("luasnip.util.parser").parse_snippet
-- ai     = require("luasnip.nodes.absolute_indexer")


local snips = {
    s(
        "sn",
        fmta(
        --========
            [[
            s(
                "<1>",
            <5>(
                --===== <2> =====
                <3>
                <6>
                <4>,
                --===============
                {
                    <7>
                }
            )
            ),
            ]],
            --========
            {
                i(1, "prefix"), -- 1
                rep(1), -- 2
                t("[["), -- 3
                t("]]"), -- 4
                c(2, -- 5
                    {
                        i(nil, "fmt"),
                        i(nil, "fmta"),
                    }
                ),
                i(3, "body here"), -- 6
                i(4, "args"), -- 7
            },
            {
                trim_empty = false,
            }
        )
    ),
    -- TODO:config with this
    s(
        "rq",
        fmt('local {} = require("{}")', {
            l(l._1:match("[^.]*$"):gsub("[^%a]+", "_"), 1),
            i(1, "module"),
        })
    ),
    parse("lm", "local M = {}\n\nfunction M.setup()\n  $1 \nend\n\nreturn M"),
}

return snips