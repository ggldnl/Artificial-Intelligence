from collections import namedtuple
from typing import List, Callable, Tuple
from random import choices, randint, randrange, random


Genome = List[int]
Population = List[Genome]
FitnessFunction = Callable[[Genome], int]
PopulateFunction = Callable[[], Population]
SelectionFunction = Callable[[Population, FitnessFunction], Tuple[Genome, Genome]]
CrossoverFunction = Callable[[Genome, Genome], Tuple[Genome, Genome]]
MutationFunction = Callable[[Genome], Genome]
Gene = namedtuple('Gene', ['attribute', 'value', 'weight'])

def generate_genome(length: int) -> Genome:
    """
    To generate the genome, we generate a random list of ones and zeros
    """
    return choices([0, 1], k=length)

def generate_population(size: int, genome_length: int) -> Population:
    """
    Population is a list of genomes
    """
    return [generate_genome(genome_length) for _ in range(size)]

def fitness(genome: Genome) -> int: # fitness level
    if len(genome) != len(genes):
        raise ValueError('')
    
    # compute the fitness

    return fitness_value

def select(population: Population, fitness_function: FitnessFunction, k: int) -> Population:
    if k >= len(population):
        raise ValueError('')

    return choices(
        population=population,
        
        # solutions with a higher fitness should be more likely to be chosen
        weights=[fitness_function(genome) for genome in population],
        
        # how many?
        k=k
    )

def select_pairs(population: Population, fitness_function: FitnessFunction) -> Population:
    return select(population, fitness_function, 2)

def crossover(a: Genome, b: Genome, k: int) -> Tuple[Genome, Genome]:
    if len(a) != len(b):
        raise ValueError('')

    length = len(a)
    if length < 2:
        raise ValueError('')

    crossover_idx = [randint(1, length - 1) for i in range(k)]
    for p in crossover_idx:
        a = a[:p] + b[p:]
        b = b[:p] + a[p:]
    return a, b

def single_point_crossover(a: Genome, b: Genome) -> Tuple[Genome, Genome]:
    return crossover(a, b, 1)

def mutation(genome: Genome, k: int = 1, probability: float = 0.5) -> Genome:
    for _ in range(k):
        p = randrange(len(genome))
        genome[p] = genome[p] if random() > probability else abs(genome[p] - 1)
    return genome

def run_evolution(
        populate_function: PopulateFunction,
        fitness_function: FitnessFunction,
        fitness_limit: int,
        selection_function: SelectionFunction,
        crossover_function: CrossoverFunction,
        mutation_function: MutationFunction,
        generation_limit: int = 100
) -> Tuple[Population, int]:
    
    # first ever generation
    population = populate_function()

    # generate #generation_limit times
    for i in range(generation_limit):
        
        # comes in handy when we want to check if we reached the
        # fitness limit and when we want to take the best k genomes
        population = sorted(
            population,
            key=lambda genome: fitness_function(genome),
            reverse=True
        )

        # sorted -> population[0] has the greatest fitness value
        if fitness_function(population[0] >= fitness_limit):
            break # done with the generation

        # retain the best k genomes of the population
        # where k is random
        random_retain = randint(1, len(population // 2))
        next_generation = population[0:random_retain]

        # generate remaining genomes for the next generation
        for _ in range(random_retain):
            parent_a, parent_b = selection_function(population, fitness_function)
            offspring_a, offspring_b = crossover_function(parent_a, parent_b)
            offspring_a = mutation_function(offspring_a)
            offspring_b = mutation_function(offspring_b)
            next_generation += [offspring_a, offspring_b]

        population = next_generation

    population = sorted(
        population,
        key=lambda genome: fitness_function(genome),
        reverse=True
    )
    
    # return (population, generation) if we did not reach the generation limit
    # and still found the best solution, (population, generation_limit - 1) 
    # if there might still be another (better) solution 
    return population, i != generation_limit - 1

def genome_to_genes(genome: Genome, genes: List[Gene]) -> List[Gene]:
    result = []
    for i, thing in enumerate(genes):
        if genome[i] == 1:
            result += [thing.name]
    return result

# Backpack example: we have a bunch of items, each with a different weight
# and a usage score; we need to pack a 3Kg backpack for a flight and we 
# want to select the best item combination (max utility keeping weight <= 3Kg)  

genes = [
    Gene('Laptop', 500, 2200),
    Gene('Headphones', 150, 160),
    Gene('Coffee mug', 60, 350),
    Gene('Notepad', 40, 333),
    Gene('Water bottle', 30, 192),
    Gene('Mints', 5, 25),
    Gene('Socks', 10, 38),
    Gene('Tissues', 15, 80),
    Gene('Phone', 100, 70)
]

start = time.time()
population, generations = run_evolution(
    populate_function=partial(
        generate_population, size=10, genome_length=len(genes)
    ),
    fitness_function=partial(
        fitness, genes=genes
    ),
    fitness=740,
    generation_limit=100
)
end = time.time()

print(f'number of generations: {generations}')
print(f'best solution: {genome_to_genes(population[0], genes)}')
print(f'elapsed time: {end - start}s')
