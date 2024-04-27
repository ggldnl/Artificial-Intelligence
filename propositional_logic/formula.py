from enum import Enum
import re


class Symbol(Enum):

    AND = ['&', 'and', '^']
    OR = ['|', 'or', 'v']
    NOT = ['!', 'not']
    OPEN_BRACKET = ['(', '[', '{']
    CLOSED_BRACKET = [')', ']', '}']

    @classmethod
    def get(cls, op):
        for elem in list(cls):
            if op == elem:
                return elem
        return None

    def __eq__(self, other):
        if isinstance(other, Symbol):
            return self.value == other.value
        elif isinstance(other, str):
            return any(other == s for s in self.value)
        else:
            raise ValueError(f'Cannot compare objects of type {type(other)} with self ({type(self)}).')

    def __str__(self):
        return self.value[0]
    
    def __repr__(self) -> str:
        return self.__str__()

    def __hash__(self):
        return hash(tuple(self.value))


class Formula:

    def __init__(self, formula):
        """
        Object representing a Propositional Logic formula. The constructor expects
        a very strictly formatted string. You can use the convenience from_infix
        method instead that will create a formula for you.

        :param formula: str
            Strictly formatted string expressing the formula in postfix notation.
            The string should be lowercase, it should have spaces separating all
            the elements (variables, operators, parentheses) and should be a valid
            propositional logic formula.
        """

        self.formula = formula

    @classmethod
    def _translate(cls, formula):
        result = []
        for token in formula.split():
            converted_token = Symbol.get(token)
            result.append(converted_token if converted_token is not None else token)
        return result

    @staticmethod
    def _preprocess(formula):
        
        # Lowercase the formula
        formula = formula.lower()

        # Add space between each character - this will break some operand descriptors (e.g. 'and')
        # formula = ' '.join(list(formula))

        # Add spaces only around brackets
        # formula = re.sub(r'(\(|\))', r' \1 ', formula)  # Only parentheses
        formula = re.sub(r'([\(\)\[\]\{\}\<\>])', r' \1 ', formula)

        formula = Formula._translate(formula)

        return formula

    @staticmethod
    def _preprocess_interpretation(interpretation):

        # Lowercase the keys
        interpretation = {key.lower(): value for key, value in interpretation.items()}

        return interpretation

    @staticmethod
    def _is_variable(symbol):
        return symbol not in list(Symbol)

    @staticmethod
    def _is_operator(symbol):
        return symbol in list(Symbol)

    @classmethod   
    def from_infix(cls, string_formula):

        formula = Formula._preprocess(string_formula)

        precedence = {
            Symbol.NOT: 3,
            Symbol.AND: 2,
            Symbol.OR: 2,
            Symbol.OPEN_BRACKET: 1,
            Symbol.CLOSED_BRACKET: 1
        }

        stack = []
        postfix = []

        for token in formula:

            if Formula._is_variable(token):
                postfix.append(token)
            elif token == Symbol.OPEN_BRACKET:
                stack.append(token)
            elif token == Symbol.CLOSED_BRACKET:
                while stack and stack[-1] != Symbol.OPEN_BRACKET:
                    postfix.append(stack.pop())
                stack.pop()  # Discard '('
            else:  # Token is an operator (and, or, not)
                while stack and precedence.get(token) <= precedence.get(stack[-1]):
                    postfix.append(stack.pop())
                stack.append(token)

        while stack:
            postfix.append(stack.pop())

        return cls(' '.join([str(elem) for elem in postfix]))

    def __str__(self):
        return self.formula

    def is_model(self, interpretation):
        return self.evaluate(interpretation)

    def evaluate(self, interpretation):

        interpretation = Formula._preprocess_interpretation(interpretation)

        stack = []

        for token in self.formula.split():

            if Formula._is_variable(token):
                stack.append(token)
            else:
                token = Symbol.get(token)
                if token == Symbol.NOT:

                    operand = stack.pop()

                    if not isinstance(operand, bool):
                        operand = interpretation[operand]

                    stack.append(not operand)
                else:
                    operand2 = stack.pop()
                    operand1 = stack.pop()

                    if not isinstance(operand2, bool):
                        operand2 = interpretation[operand2]

                    if not isinstance(operand1, bool):
                        operand1 = interpretation[operand1]

                    if token == Symbol.AND:
                        stack.append(operand1 and operand2)
                    elif token == Symbol.OR:
                        stack.append(operand1 or operand2)

        # If we have only one literal we skip the part where it should be evaluated
        # since there are no operators. We can check if the stack contains strings
        # (variables) at the end of the evaluation and replace their value with the
        # truth value in the interpretation
        if len(stack) > 1:
            raise ValueError(f'Malformed formula: {self.formula}')

        if isinstance(stack[0], str):
            return interpretation[stack[0]]

        # The stack already contains the truth value
        return stack[0]

    # TODO
    def _eliminate_implications(self):
        pass

    # TODO
    def _move_negations_inward(self):
        pass

    # TODO
    def _distribute_disjunctions(self):
        pass

    # TODO
    def _extract_clauses(self):
        pass

    # TODO
    def to_cnf(self):
        pass

    def variables(self):
        return [elem for elem in self.formula.split() if Formula._is_variable(elem)]

    def operators(self):
        return [elem for elem in self.formula.split() if Formula._is_operator(elem)]


def print_formula(formula, interpretation=None):

    formula = Formula._preprocess(formula)

    if interpretation is not None:
        interpretation = Formula._preprocess_interpretation(interpretation)
        interpr_sub_arr = [str(interpretation[elem] if Formula._is_variable(elem) else elem) for elem in formula]
    else:
        interpr_sub_arr = [str(elem) for elem in formula]

    print(' '.join(interpr_sub_arr))


if __name__ == '__main__':

    print(f'\n--- Parse formula ---')

    # infix_formula = "((A & B) | (! C))"
    # infix_formula = "x1 and not x1 or not x2 and x2 or x3 and not x3 or x4 and x2 or x5"
    infix_formula = "(x1 or not x2) and ((x3 and x4) or (x1 and x3))"

    formula = Formula.from_infix(infix_formula)
    print(f'Formula:    {infix_formula}')
    print(f'Postfix:    {formula}')

    print(f'\n--- Evaluate the formula ---')

    # interpretation = {'a': True, 'B': False, 'c': False, 'D': False}
    # interpretation = {'x1': True, 'x2': False, 'x3': False, 'x4': False, 'x5': True}
    interpretation = {'x1': True, 'x2': False, 'x3': False, 'x4': False, 'x5': True}

    print_formula(infix_formula, interpretation)
    print(f'Evaluation: {formula.evaluate(interpretation)}')
    print(f'Model     : {formula.is_model(interpretation)}')
