// Prove that 1)-4) are all equivalent for connected 
// graph G:
// 1) Graph G is acyclic
// 2) For any u,v from G exactly one way u->v exists
// 3) G would become disconnected 
//    if any single edge is removed
// 4) |nodes| = |edges| + 1


sig Node
{}

sig Edge
{
    u,v: Node
}

sig Graph
{
    nodes: set Node,
    edges: set Edge
}

pred hasNode [uv: Edge, n: Node]
{
	uv.v = n || uv.u = n
}


pred isCycle [cycle: some Edge]
{
    all edge: Edge | edge in cycle implies ( 
    ( one l: Edge | l in cycle => l.hasNode[edge.u] ) &&
    ( one r: Edge | r in cycle => r.hasNode[edge.v] ))
}

// 1)
pred isAcyclic [g: Graph]
{
    no cycle: some Edge |
    cycle in g.edges && cycle.isCycle
}

// 4)
pred _4 [g: Graph]
{
    g.nodes.size = 1 + g.edges.size
}

check { all g: Graph | g._4 iff g.isAcyclic} for 3 but 10 Graph
// 3)
pred minimallyConnected [g: Graph]
{
    1 = 1// all edge: edge in g.edges
    
}

// 0)
pred isConnected [g: Graph]
{
	1 = 1
}









//pred isParentOf [a: Node, b: Node]
//{
//	a.left == b || a.right == b
//}

//pred higherThan [a: Node, b: Node]
//{
//	a in b.^parent
//}

//pred isAcyclic [root: Node]
//{
//	no a: Node | root.higherThan[a]
//	&& a.higherThan[a] 
//}


