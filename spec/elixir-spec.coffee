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

  it "tokenizes symbols", ->
    {tokens} = grammar.tokenizeLine(':erlang.system_info')
    expect(tokens[0]).toEqual value: ':', scopes: ['source.elixir', 'constant.other.symbol.elixir', 'punctuation.definition.constant.elixir']
    expect(tokens[1]).toEqual value: 'erlang', scopes: ['source.elixir', 'constant.other.symbol.elixir']

    {tokens} = grammar.tokenizeLine('size: 0')
    expect(tokens[0]).toEqual value: 'size', scopes: ['source.elixir', 'constant.other.symbol.elixir']
    expect(tokens[1]).toEqual value: ':', scopes: ['source.elixir', 'constant.other.symbol.elixir', 'punctuation.definition.constant.elixir']

    {tokens} = grammar.tokenizeLine('size: :erlang.system_info')
    expect(tokens[0]).toEqual value: 'size', scopes: ['source.elixir', 'constant.other.symbol.elixir']
    expect(tokens[1]).toEqual value: ':', scopes: ['source.elixir', 'constant.other.symbol.elixir', 'punctuation.definition.constant.elixir']
    expect(tokens[3]).toEqual value: ':', scopes: ['source.elixir', 'constant.other.symbol.elixir', 'punctuation.definition.constant.elixir']
    expect(tokens[4]).toEqual value: 'erlang', scopes: ['source.elixir', 'constant.other.symbol.elixir']

  it "tokenizes comments", ->
    {tokens} = grammar.tokenizeLine("# TODO: stuff")
    expect(tokens[0]).toEqual value: '#', scopes: ['source.elixir', 'comment.line.number-sign.elixir', 'punctuation.definition.comment.elixir']
    expect(tokens[1]).toEqual value: ' TODO: stuff', scopes: ['source.elixir', 'comment.line.number-sign.elixir']
