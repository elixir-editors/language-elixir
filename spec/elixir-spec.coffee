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

  it "tokenizes bitwise operators", ->
    {tokens} = grammar.tokenizeLine('left &&& right')
    expect(tokens[1]).toEqual value: '&&&', scopes: ['source.elixir', 'keyword.operator.bitwise.elixir']

    {tokens} = grammar.tokenizeLine('left >>> right')
    expect(tokens[1]).toEqual value: '>>>', scopes: ['source.elixir', 'keyword.operator.bitwise.elixir']

    {tokens} = grammar.tokenizeLine('left <<< right')
    expect(tokens[1]).toEqual value: '<<<', scopes: ['source.elixir', 'keyword.operator.bitwise.elixir']

    {tokens} = grammar.tokenizeLine('left ^^^ right')
    expect(tokens[1]).toEqual value: '^^^', scopes: ['source.elixir', 'keyword.operator.bitwise.elixir']

    {tokens} = grammar.tokenizeLine('left ||| right')
    expect(tokens[1]).toEqual value: '|||', scopes: ['source.elixir', 'keyword.operator.bitwise.elixir']

    {tokens} = grammar.tokenizeLine('~~~exp')
    expect(tokens[0]).toEqual value: '~~~', scopes: ['source.elixir', 'keyword.operator.bitwise.elixir']

  it "tokenizes comparison operators", ->
    {tokens} = grammar.tokenizeLine('left === right')
    expect(tokens[1]).toEqual value: '===', scopes: ['source.elixir', 'keyword.operator.comparison.elixir']

    {tokens} = grammar.tokenizeLine('left == right')
    expect(tokens[1]).toEqual value: '==', scopes: ['source.elixir', 'keyword.operator.comparison.elixir']

    {tokens} = grammar.tokenizeLine('left != right')
    expect(tokens[1]).toEqual value: '!=', scopes: ['source.elixir', 'keyword.operator.comparison.elixir']

    {tokens} = grammar.tokenizeLine('left !== right')
    expect(tokens[1]).toEqual value: '!==', scopes: ['source.elixir', 'keyword.operator.comparison.elixir']

    {tokens} = grammar.tokenizeLine('left <= right')
    expect(tokens[1]).toEqual value: '<=', scopes: ['source.elixir', 'keyword.operator.comparison.elixir']

    {tokens} = grammar.tokenizeLine('left >= right')
    expect(tokens[1]).toEqual value: '>=', scopes: ['source.elixir', 'keyword.operator.comparison.elixir']

    {tokens} = grammar.tokenizeLine('left =~ right')
    expect(tokens[1]).toEqual value: '=~', scopes: ['source.elixir', 'keyword.operator.comparison.elixir']

  it "tokenizes logical operators", ->
    {tokens} = grammar.tokenizeLine('left || right')
    expect(tokens[1]).toEqual value: '||', scopes: ['source.elixir', 'keyword.operator.logical.elixir']

    {tokens} = grammar.tokenizeLine('left && right')
    expect(tokens[1]).toEqual value: '&&', scopes: ['source.elixir', 'keyword.operator.logical.elixir']

  it "tokenizes other operators", ->
    {tokens} = grammar.tokenizeLine('left |> right')
    expect(tokens[1]).toEqual value: '|>', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left ++ right')
    expect(tokens[1]).toEqual value: '++', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left -- right')
    expect(tokens[1]).toEqual value: '--', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left \\\\ right')
    expect(tokens[1]).toEqual value: '\\\\', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left <- right')
    expect(tokens[1]).toEqual value: '<-', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left <> right')
    expect(tokens[1]).toEqual value: '<>', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left :: right')
    expect(tokens[1]).toEqual value: '::', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left .. right')
    expect(tokens[1]).toEqual value: '..', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left => right')
    expect(tokens[1]).toEqual value: '=>', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left -> right')
    expect(tokens[1]).toEqual value: '->', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left <<~ right')
    expect(tokens[1]).toEqual value: '<<~', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left <~ right')
    expect(tokens[1]).toEqual value: '<~', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left ~>> right')
    expect(tokens[1]).toEqual value: '~>>', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left ~> right')
    expect(tokens[1]).toEqual value: '~>', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left <~> right')
    expect(tokens[1]).toEqual value: '<~>', scopes: ['source.elixir', 'keyword.operator.other.elixir']

    {tokens} = grammar.tokenizeLine('left <|> right')
    expect(tokens[1]).toEqual value: '<|>', scopes: ['source.elixir', 'keyword.operator.other.elixir']

  it "tokenizes arrays", ->
    {tokens} = grammar.tokenizeLine('[]')
    expect(tokens[0]).toEqual value: '[]', scopes: ['source.elixir', 'punctuation.section.array.elixir']

    {tokens} = grammar.tokenizeLine('[1,2,3]')
    expect(tokens[0]).toEqual value: '[', scopes: ['source.elixir', 'punctuation.section.array.elixir']
    expect(tokens[6]).toEqual value: ']', scopes: ['source.elixir', 'punctuation.section.array.elixir']
