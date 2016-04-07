# Competency-Tracker
Competency tracker application:

This app will be used to keep track of people and their competence level (i.e. beginner, intermediate, advanced, expert) for various skills that will be entered by the app user. There may exist relationships between the skills that a person selects with other skills e.g. a person can only be a senior software programmer if he/she is a senior tester, etc. In this case, testing will be a prerequisite for senior software programmer. Based on the prerequisites that will be stated on the app for different skills, a person can follow a path to determine what he/she needs to learn to get a desired competency level for a skill. This app can be used by team leaders, business owners, etc. to keep track of the skills of the people under them or keep track of a team in order to delegate tasks to fit peoples skills. Also, it can be used for hiring purposes whereby an employer will login into the app and select the skills they require for a job opening and people that fit those skills will be showcased.

The Sign up/ Sign in system has been implemented using the Devise gem. Users were further modified to allow for user types (programmer, manager, administrator)

Programmer:
Programmers may add skills they have to their profile, these are a combination of the skill and the level of experience they have with the skill (beginner, intermediate, advanced, expert). Managers will be able to view that they have these skills and may contact the programmer through the apps messaging system. From the programmers profile they may see how many endorsements they have on their skills. 

Manager:
Managers may search for programmers with a specific skillset, this is a combination of the skill and the level of expertise the manager requires in that skill. They may view skills that were recently added to programmers profiles along with endorsements they have received. On the programmers profile a manager may endorse any of their skills, and they may message the programmer from their profile. 

Conversations:
Conversations are always between 2 members of the website. A conversation has the messages of the member who with you are talking to highlighted as a seperate color. "New!" message will show on the conversations page if there is a message/conversation which you have not yet read. Once you open the conversation this notification will set read = 1 and dissapear.

Administrator:
The administrator can hold regular conversations between members just as programmers and managers do. o	All functionality which is allowed only by the admin (adding, creating, etc) is verified in the controller class. These actions all require use level 9 to be completed, otherwise an unauthorized page will display. The administrator is allowed to add skills to the database (no duplicates allowed), add materials required for a specific skill + knowledge combination, add skill assignments to any users, add new skill levels, create prerequisites and create endorsements.

Still Unfinished
- Adding skills to specific categories
- Notifying programmers of skills that are in demand
- Add metrics (total programmers, total managers, top endorsed users, etc...) to the administrator section.
- Adding sample tests to a skill at a given level that a programmer may take in order to see if they have the required knowledge to claim this skill on their profile. 
