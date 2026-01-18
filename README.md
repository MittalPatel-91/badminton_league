# README

**Project Summary:**
---
**Implementation**
---
Currently, I'm using two tables to keep things lightweight:

1. Players: Stores player name and their overall win/loss count.
2. MatchResults: Tracks who won/lose the match.

---
Enhancement/Scalling we can do
---

- While this works perfectly for current needs, here’s how I’d take it to the next level:

- REST API: Move to a full API structure for better security (Auth/Validations) and to allow mobile or React/Vue frontends to connect easily.

- Further Normalization: Break the data into three tables (Players, Matches, MatchDetails) to track detailed stats like individual scores or fouls per match.

- Team Support: If we ever want to do 2v2 matches, I’d introduce a Teams table. This would link players to teams, and we’d simply track team_id in the match details instead of individual players.

- Also, we can handle unique validations on players based on player email or on other fields. As of now, I have added the uniqness on player name column.

- Apart from this, we can also introduce the background job to update the leaderboard on a live bases so once any match data is created, it will calculate all the details of the player and update the leaderboard without refreshing the page.

---
**Requirements:**
---
Build a basic web application to manage a badminton league, where users can:
    - Add and manage players
    - Record match results between players
    - Track player rankings based on wins and losses

**Core Requirements:**

1. Player Management
    - Ability to add and remove players
    - View list of all players
2. Match Tracking
    - Record the result of a match (e.g., Player A vs Player B, who won)
    - Each match must store the winner and loser
3. Leaderboard / Stats
    - Show the number of wins and losses per player
    - Display a simple ranking based on most wins

**Notes:**
1. This is not a design test.
2. Front end Basic HTML/CSS is totally fine.
3. Back end is ROR.
4. Use standard coding conventions.
5. Focus on clean, readable code and a sensible data model.
