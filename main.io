Importer addSearchPath("core")

chain := Chain clone
chain generateNextBlock("foobar") println
chain debug
