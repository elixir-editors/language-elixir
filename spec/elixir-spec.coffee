describe "Elixir grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-elixir")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.elixir")

  it "parses the grammar", ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe "source.elixir"
