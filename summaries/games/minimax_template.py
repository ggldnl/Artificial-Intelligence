from abc import ABC, abstractmethod
from enum import Enum

class Player(Enum):
    MIN = 0,
    MAX = 1

class MinimaxTemplate(ABC):

    @abstractmethod
    def terminal(state):
        """
        Tells us if the state is terminal.
        """
        pass

    @abstractmethod
    def value(state):
        """
        Assigns a value to the state. The MAX player needs to maximize it while the MIN
        player needs to minimize it.
        """
        pass

    @abstractmethod
    def player(state):
        """
        Tells us which player needs to make the next move.
        """
        pass

    @abstractmethod
    def actions(state):
        """
        Tells us the available actions for the player in the state.
        """
        pass

    @abstractmethod
    def result(state, action):
        """
        Takes a state and an action and returns the new state resulted from applying 
        the action to the old state.
        """
        pass

    def minimax(state):
        
        if MinimaxTemplate.terminal(state):
            return MinimaxTemplate.value(state)
        
        if MinimaxTemplate.player(state) == Player.MAX:

            # In Python, there is no way or method to represent infinity as an integer. 
            # This matches the fundamental characteristic of many other popular programming 
            # languages. But due to python being dynamically typed language, you can use 
            # float(inf) as an integer to represent it as infinity.
            v = float('-inf')

            for a in MinimaxTemplate.actions(state):
                v = max(v, MinimaxTemplate.minimax(MinimaxTemplate.result(state, a)))
            
            return v

        if MinimaxTemplate.player(state) == Player.MIN:

            v = float('inf')

            for a in MinimaxTemplate.actions(state):
                v = min(v, MinimaxTemplate.minimax(MinimaxTemplate.result(state, a)))
                
            return v