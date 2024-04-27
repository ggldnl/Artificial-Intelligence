from formula import Formula


class Node:

    def __init__(self, value):
        self.value = value
        self.children = []

        # Nodes will contain interpretations (dictionaries)
        # Dictionaries are not hashable
        self.footprint = _interpretation_footprint(self.value)

    def __hash__(self):
        return self.footprint


def _default_interpretation(variables):
    return {key: False for key in variables}


def _interpretation_footprint(interpretation):
    """
    Just a hashable string containing the values of the ordered variables
    """
    return ''.join([str(int(interpretation[key])) for key in sorted(interpretation.keys())])


def _build_complete_interpretation_tree(initial_interpretation, allow_duplicates=True, max_level=float('inf')):

    root = Node(initial_interpretation)
    seen = set() if not allow_duplicates else None
    stack = [(root, 0)]

    while stack:

        node, level = stack.pop()

        if not allow_duplicates:
            seen.add(node)

        if level < max_level:
            for i in range(len(node.value)):
                new_interpretation = node.value.copy()
                flip_key = sorted(new_interpretation.keys())[i]
                new_interpretation[flip_key] = not new_interpretation[flip_key]
                child_node = Node(new_interpretation)

                if allow_duplicates or node not in seen:
                    node.children.append(child_node)
                    stack.append((child_node, level + 1))

    return root


def _get_children(interpretation):
    swapped_dicts = []

    for key in sorted(interpretation.keys()):
        # Create a new dictionary with the swapped boolean value for the current key
        swapped_interpretation = interpretation.copy()
        swapped_interpretation[key] = not swapped_interpretation[key]
        swapped_dicts.append(swapped_interpretation)

    return swapped_dicts


def _count_clauses(clauses, interpretation):
    return sum([int(clause.evaluate(interpretation)) for clause in clauses])


def gsat(clauses, initial_interpretation=None, max_level=float('inf'), verbose=True):

    # Get the variables
    variables = set([variable for clause in clauses for variable in clause.variables()])

    if initial_interpretation is None:
        initial_interpretation = _default_interpretation(variables)

    root_interpretation = initial_interpretation.copy()

    if verbose:
        print(f'Initial interpretation: {_interpretation_footprint(root_interpretation)}\n')

    current_level = 0
    while current_level < max_level:

        if verbose:
            print(f'Level: {current_level}')

        children_interpretations = _get_children(root_interpretation)

        clause_count = [sum([int(clause.evaluate(interpretation)) for clause in clauses]) for interpretation in children_interpretations]

        if verbose:
            print('\t'.join([f'{_interpretation_footprint(children_interpretations[i])}/{clause_count[i]}' for i in range(len(children_interpretations))]))
        
        i = max(range(len(clause_count)), key=lambda i: clause_count[i])
        root_interpretation = children_interpretations[i]

        if verbose:
            print(f'Selected interpretation [{i}]: {_interpretation_footprint(root_interpretation)}\n')

        current_level += 1


if __name__ == '__main__':

    infix_formula = "x1, not x1 or not x2, x2 or x3, not x3 or x4, x2 or x5"

    # TODO use a real algorithm to convert the formula to cnf and extract the clauses
    clauses = infix_formula.split(',')
    clauses = [Formula.from_infix(clause) for clause in clauses]

    initial_interpretation = {'x1': True, 'x2': False, 'x3': False, 'x4': True, 'x5': False}

    gsat(clauses, initial_interpretation=initial_interpretation, max_level=5)
