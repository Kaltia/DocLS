comment = /^\s*\#.*$/g

parsing = module.exports = {}

parsing.generatorTuples = (lines) ->
  index = 0
  tuple = []
  while index < lines.length - 1
    [index, comment] = parsing.consumeComment lines, index
    [index, code]  = parsing.consumeCode lines, index
    tuple.push [comment, code]
    /*break if index == lines.lenght*/
  tuple

parsing.consumeComment = (lines, index) ->
  comments = ""
  for i from index til lines.length
    if comment.test lines[i] then comments += lines[i] + '\n' else  break
  [i, comments]

parsing.consumeCode = (lines, index) ->
  code = ""
  for i from index til lines.length
    if not comment.test lines[i] then code +=  lines[i] + '\n' else  break
  [i, code]
