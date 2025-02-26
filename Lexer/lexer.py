import re
import sys

TOKEN_SPECIFICATION = [
    (r'\bpackage\b', 'T_PACKAGE'),
    (r'\bfunc\b', 'T_FUNC'),
    (r'\bint\b', 'T_INTTYPE'),
    (r'\breturn\b', 'T_RETURN'),
    (r'\b[a-zA-Z_][a-zA-Z0-9_]*\b', 'T_ID'),  
    (r'\d+', 'T_CONSTANT'),  
    (r'\{', 'T_LCB'),
    (r'\}', 'T_RCB'),
    (r'\(', 'T_LPAREN'),
    (r'\)', 'T_RPAREN'),
    (r';', 'T_SEMICOLON'),
    (r'\s+', 'T_WHITESPACE'),  
]

def lexical_analyzer(input_text):
    tokens = []
    while input_text:
        match = None
        for regex, token_type in TOKEN_SPECIFICATION:
            pattern = re.compile(regex)
            match = pattern.match(input_text)
            if match:
                value = match.group(0)
                tokens.append((token_type, value))
                input_text = input_text[len(value):] 
                break
        if not match:
            raise ValueError(f"LEXICAL ERROR: UNKNOWN TOKEN AT '{input_text[:10]}' ")
    return tokens

# Example input
input_program = sys.stdin.read()
tokens = lexical_analyzer(input_program)

# Print tokens
for token in tokens:
    print(token)
