# One.Putting the Domain Model to Work

__Model__: Every model represents some aspect of reality or an idea that is of interest. It is an interpretation of reality that abstracts the aspects relevant to solving the problem at hand and ignores extraneous detail.

__Domain__ :Every software program relates to some activity or interest of its user. That subject area to which the user applies the program is the domain of the software.

A model is a selectively simplified and consciously structured form of knowledge.

A domain model is not a particular diagram; it is the idea that the diagram is intended to convey. it is a rigorously organized and selective abstraction of that knowledge

## The Utility of a Model in Domain-Driven Design
1. __The model and the heart of the design shape each other.__, This binding of model and implementation also helps during maintenance and continuing development
2. __The model is the backbone of a language used by all team members.__
3. __The model is distilled knowledge.__

## The Heart of Software

> The heart of software is its ability to solve domain-related problems for its user.

## Ingredients of Effective Modeling
1. __Binding the model and the implementation.__
2. __Cultivating a language based on the model.__
3. __Developing a knowledge-rich model.__
4. __Distilling the model.__
5. __Brainstorming and experimenting__

It is the creativity of brainstorming and massive experimentation, leveraged through a model-based language and disciplined by the feedback loop through implementation, that makes it possible to find a knowledge-rich model and distill it

> Good programmers will naturally start to abstract and develop a model that can do more work

## Deep Model
Useful models seldom lie on the surface. As we come to understand the domain and the needs of the application, we usually discard superficial model elements that seemed important in the beginning, or we shift their perspective


> Knowledge crunching is an exploration, and you can’t know where you will end up.

# Two. Communication and the Use of Language
A domain model can be the core of a common language for a software project. The model is a set of concepts built up in the heads of people on the project, with terms and relationships that reflect domain insight.

A project faces serious problems when its language is fractured. Domain experts use their jargon while technical team members have their own language tuned for discussing the domain in terms of design.

Translation blunts communication and makes knowledge crunching anemic.
A project needs a common language that is more robust than the lowest common denominator

The vocabulary of that UBIQUITOUS LANGUAGE includes the names of classes and prominent operations. The LANGUAGE includes terms to discuss rules that have been made explicit in the model.

The model relationships become the combinatory rules all languages have. The meanings of words and phrases echo the semantics of the model.

Committed to using this language in the context of implementation, the developers will point out imprecision or contradictions, engaging the domain experts in discovering workable alternatives.

Recognize that a change in the UBIQUITOUS LANGUAGE is a change to the model.

The UBIQUITOUS LANGUAGE is the primary carrier of the aspects of design that don’t appear in code—large- scale structures that organize the whole system, BOUNDED CONTEXTS that define the relationships of different systems and models, and other patterns applied to the model and design.

Play with the model as you talk about the system. Describe scenarios out loud using the elements and interactions of the model, combining concepts in ways allowed by the model. Find easier ways to say what you need to say, and then take those new ideas back down to the diagrams and code.

If sophisticated domain experts don’t understand the model, there is something wrong with the model.