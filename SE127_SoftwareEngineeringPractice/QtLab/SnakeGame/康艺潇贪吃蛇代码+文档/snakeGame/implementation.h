#ifndef IMPLEMENTATION_H
#define IMPLEMENTATION_H

#include "public.h"

bool operator == (GridLocation a, GridLocation b);
bool operator != (GridLocation a, GridLocation b);
bool operator < (GridLocation a, GridLocation b);
std::basic_iostream<char>::basic_ostream& operator<<(std::basic_iostream<char>::basic_ostream& out, const GridLocation& loc);

namespace std {
/* implement hash function so we can put GridLocation into an unordered_set */
template <> struct hash<GridLocation> {
  typedef GridLocation argument_type;
  typedef std::size_t result_type;
  std::size_t operator()(const GridLocation& id) const noexcept {
    return std::hash<int>()(id.x ^ (id.y << 4));
  }
};
}

struct SquareGrid {
  static std::array<GridLocation, 4> DIRS;

  int width, height;
  std::unordered_set<GridLocation> walls;

  SquareGrid(int width_, int height_)
     : width(width_), height(height_) {}

  bool in_bounds(GridLocation id) const {
    return 0 <= id.x && id.x < width
        && 0 <= id.y && id.y < height;
  }

  bool passable(GridLocation id) const {
    return walls.find(id) == walls.end();
  }

  std::vector<GridLocation> neighbors(GridLocation id) const {
    std::vector<GridLocation> results;
    for (GridLocation dir : DIRS) {
      GridLocation next{id.x + dir.x, id.y + dir.y};
      if (in_bounds(next) && passable(next)) {
        results.push_back(next);
      }
    }

    if ((id.x + id.y) % 2 == 0) {
      // aesthetic improvement on square grids
      std::reverse(results.begin(), results.end());
    }

    return results;
  }
};

template<typename T, typename priority_t>
struct PriorityQueue {
  typedef std::pair<priority_t, T> PQElement;
  std::priority_queue<PQElement, std::vector<PQElement>,
                 std::greater<PQElement>> elements;

  inline bool empty() const {
     return elements.empty();
  }

  inline void put(T item, priority_t priority) {
    elements.emplace(priority, item);
  }

  T get() {
    T best_item = elements.top().second;
    elements.pop();
    return best_item;
  }
};


template<typename Location>
void reconstruct_path(std::vector<Location> &path,
   Location start, Location goal,
   std::unordered_map<Location, Location> came_from
) {
    path.clear();
  Location current = goal;
  while (current != start) {
//      printf("start: (%d %d) current: (%d %d) goal: (%d %d)\n", start.x, start.y,
//             current.x, current.y, goal.x, goal.y);
    path.push_back(current);
    current = came_from[current];
  }
  path.push_back(start); // optional
  std::reverse(path.begin(), path.end());
}

template<typename Location>
void reconstruct_path_1(std::vector<Location> &path,
   Location start, Location nextMove, Location goal,
   std::unordered_map<Location, Location> came_from
) {
  reconstruct_path(path, start, nextMove, came_from);

  path.push_back(goal);
  std::reverse(path.begin(), path.end());
}

template<typename Location, typename Graph>
int a_star_search
  (Graph graph,
   Location start,
   Location goal,
   std::unordered_map<Location, Location>& came_from,
   std::unordered_map<Location, double>& cost_so_far)
{
  came_from.clear();
  cost_so_far.clear();
  bool isPathFound = false;
  PriorityQueue<Location, double> frontier;
  frontier.put(start, 0);

  came_from[start] = start;
  cost_so_far[start] = 0;

  while (!frontier.empty()) {
    Location current = frontier.get();

    if (current == goal) {
      isPathFound = true;
      break;
    }

    for (Location next : graph.neighbors(current)) {
      double new_cost = cost_so_far[current] + graph.cost(current, next);
      if (cost_so_far.find(next) == cost_so_far.end()
          || new_cost < cost_so_far[next]) {
        cost_so_far[next] = new_cost;
        double priority = new_cost + heuristic(next, goal);
        frontier.put(next, priority);
        came_from[next] = current;
      }
    }
  }

  return isPathFound;
}

template<typename Location>
int isNextToGoal(Location pos, Location goal)
{
    if((abs(goal.x - pos.x) == 1 && goal.y == pos.y)
            || (goal.x == pos.x && abs(goal.y - pos.y) == 1))
    {
        return true;
    }
    else
    {
        return false;
    }
}

template<typename Location, typename Graph>
bool breadth_first_search(Graph graph,
                          std::unordered_map<Location, Location> &came_from,
                          std::unordered_map<Location, double> &cost_so_far,
                          Location start, Location goal) {
  came_from.clear();
  cost_so_far.clear();
  std::queue<Location> frontier;
  frontier.push(start);
  bool isFound = false;

  came_from[start] = start;
  cost_so_far[start] = 0;

  while (!frontier.empty()) {
    Location current = frontier.front();
    frontier.pop();

    if(isNextToGoal(current, goal))
    {
        isFound = true;
    }
    for (Location next : graph.neighbors(current)) {
      if (came_from.find(next) == came_from.end()) {
        frontier.push(next);
        came_from[next] = current;
        cost_so_far[next] = cost_so_far[current]+1;
      }
      else if(cost_so_far[next] > cost_so_far[current]+1)
      {
          cost_so_far[next] = cost_so_far[current]+1;
          came_from[next] = current;
      }
    }
  }
  return isFound;
}

#endif // IMPLEMENTATION_H
