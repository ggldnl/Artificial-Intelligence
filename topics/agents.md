# Rational agents

An agent is an entity that perceives and acts; a rational agent, on the other hand, is a person or entity that always aims to perform optimal actions based on given premises and information.

# Agent and environment

An AI system can be defined as the study of a rational agent and its environment. 
A rational agent can be anything that makes decisions, typically a person, robot or software. An agent can be seen as a black box interacting with the environment in two ways:

<p align="center">
	<ul>
		<li> takes input from the environment (perceives) </li>
		<li> produces an output (acts) </li>
	</ul>
</p>

The agents sense the environment through sensors and act on their environment through actuators.

How can we implement this box? How do the system will convert perceptions into actions?

# Agent architecture

Abstractly, an agent can be seen as a function that maps from percept histories to actions:

<p align="center">
$f: P^{*} \rightarrow A$
</p>

A $percept$ is a sequence of $perceptions$: maybe previous perceptions could help us in the future.

For a given task we seek the agent (or class of agents) with the best performance: it aims to choose whichever action maximizes the expected value of the performance measure given the percept sequence to date.
Computational limitations make perfect rationality unachievable.

# Agent types

Four basic types in order of increasing generality:

<p align="center">
	<ul>
		<li> simple reflex agents </li>
		<li> model-based reflex agents </li>
		<li> goal-based agents </li>
		<li> utility-based agents </li>
	</ul>
</p>

All these can be turned into learning agents. 